# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Devin Buhl <devin.kray@gmail.com>
pkgname="radarr"
pkgver="0.2.0.980"
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
install='radarr.install'
source=("https://github.com/galli-leo/Radarr/releases/download/v${pkgver}/Radarr.develop.${pkgver}.linux.tar.gz"
        "radarr.service"
        "radarr.sysusers")
noextract=()

sha512sums=('4636bdcd02bd06f42df0785358407208ba30a7bc0e9cf04cc038727dad5fcc6ff7aeff8154928099a2c3388cab2efc70ed13a3ef6cfb72d4a956ea2cdb2129f0'
            '8dd2b91252a87d70e41487951ec89c7a0448fc06c7c7c2182ed6463b7f508c0c638d3c0413b7e6c74bfabfc12eb2e25aa9c1e1024e895766372d4e2e7ed67335'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e')

package() {
  cd "$srcdir"

  install -d -m 755 "${pkgdir}/var/lib/radarr"
  install -d -m 755 "${pkgdir}/usr/lib/radarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr"

  find "${pkgdir}/usr/lib/radarr" -type f -exec chmod 644 '{}' ';'

  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"
  install -Dm644 "$srcdir/radarr.sysusers" "$pkgdir/usr/lib/sysusers.d/radarr.conf"
}
