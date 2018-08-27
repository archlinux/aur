# Maintainer: Donald Webster <fryfrog@gmail.com>
# Helpful url: https://ci.appveyor.com/project/galli-leo/radarr-usby1/branch/develop/artifacts
pkgname="radarr-develop"
pkgver="0.2.0.1175"
_pkghash="4cby4ebxlpk6xr8q"
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

source=("https://ci.appveyor.com/api/buildjobs/${_pkghash}/artifacts/_artifacts/Radarr.develop.${pkgver}.linux.tar.gz"
        "radarr.service"
        "radarr.tmpfiles"
        "radarr.sysusers")

sha512sums=('2ae85bcc743cb5eb4503ede23adc2c65128223263c23b9ab8dfc5998d3e0b560d8b35e6d6bd0aa33cd773e7dcc6544671fcdb185fa4b58f50313342203cb331a'
            'f1f690d0a9da7d5f56dd69c5ff0acec41589730036f5e6c73d2c9b6e831c626006d5843578260c8df7ee4b93cb0c2dfda9c58c304c9691925486e33fb3b64215'
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
