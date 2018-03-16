# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Devin Buhl <devin.kray@gmail.com>
pkgname="radarr"
pkgver="0.2.0.995"
pkgrel=2
pkgdesc="Movie downloader for usenet and torrents."
arch=(any)
url="https://github.com/galli-leo/Radarr"
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

source=("https://github.com/galli-leo/Radarr/releases/download/v${pkgver}/Radarr.develop.${pkgver}.linux.tar.gz"
        "radarr.service"
        "radarr.tmpfiles"
        "radarr.sysusers")

sha512sums=('1d558e72f629e304d0bfccdf999d9ca78a81cbfaf1b3d41ae495d181997a8bb03d8c6cde07ae270b8f86f4f2b4cecdf43361d6c22ece2997c1f220ad5624269d'
            '8dd2b91252a87d70e41487951ec89c7a0448fc06c7c7c2182ed6463b7f508c0c638d3c0413b7e6c74bfabfc12eb2e25aa9c1e1024e895766372d4e2e7ed67335'
            'f6b0e13f334d96854dd28f53d4c45efbca50bc2eeed0f172f81295b105fa18e5a9370dbbef1a46ac11bb5f58ebeb045db14985d9ab902bcd4a4bb0bd2d16da51'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/radarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr"
  find "${pkgdir}/usr/lib/radarr" -type f -exec chmod 644 '{}' ';'

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -D -m 644 "${srcdir}/radarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/radarr.conf"
  install -D -m 644 "${srcdir}/radarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/radarr.conf"
}
