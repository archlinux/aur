
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://ci.appveyor.com/project/galli-leo/radarr-usby1/branch/aphrodite/artifacts

pkgname="radarr-aphrodite"
pkgver="2.0.0.1413"
_pkghash="o5eedubx5fxp2uux"
pkgrel=1
pkgdesc="Movie download automation for usenet and torrents."
arch=(any)
url="https://github.com/Radarr/Radarr"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy'
            'libgdiplus: provides a gdi+ compatible api')

provides=('radarr')
conflicts=('radarr')

source=("Radarr.aphrodite.${pkgver}.linux.tar.gz::https://ci.appveyor.com/api/buildjobs/${_pkghash}/artifacts/_artifacts%2FRadarr.aphrodite.${pkgver}.linux.tar.gz"
        'radarr.service'
        'radarr.tmpfiles'
        'radarr.sysusers')

sha512sums=('7e012bbac7991dae3af4c796d35b29d4509c5879198427da367946693f18b1a3271ab1a3788bb000b757829226b3fc645965cee4b65acb71e8e0a2bcbd5fd65c'
            '4c064051c7592529a7ed41c4fdd6381b5e9ace938608f9e271aa4126194db456e85b7602d8e13718efcc4c40d66f82a338199cb6fd924177ad23154090e48da3'
            'e0d55353f0bf89f826eb7eb9ee26c3e3f38bd46a8884135139536ae220c0c531d5df486bc3b50f580679f9607bb4b7bfb9f29998609dc966fbfb8e1809834650'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/radarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr"
  chmod -R a=,a+rX,u+w ${pkgdir}/usr/lib/radarr

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -D -m 644 "${srcdir}/radarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -D -m 644 "${srcdir}/radarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
