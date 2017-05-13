# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Devin Buhl <devin.kray@gmail.com>
pkgname="radarr"
pkgver="0.2.0.696"
pkgrel=1
pkgdesc="Movie downloader for usenet and torrents."
arch=(any)
url="https://github.com/galli-leo/Radarr"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite' 'libgdiplus')
optdepends=('sabnzbd: usenet downloader'
            'nzbget: usenet downloader'
            'transmission-cli: torrent downloader (CLI and daemon)'
            'transmission-gtk: torrent downloader (GTK+)'
            'transmission-qt: torrent downloader (Qt)'
            'deluge: torrent downloader'
            'rtorrent: torrent downloader'
            'jackett: torrent indexer proxy')
install='radarr.install'
provides=('radarr')
source=("https://github.com/galli-leo/Radarr/releases/download/v${pkgver}/Radarr.develop.${pkgver}.linux.tar.gz"
        "radarr.service"
        "radarr.sysusers")
noextract=()

sha512sums=('56357ad1c70f063f3ea913ae01a4b33124c7c14264022c0120ea1ef190e1310c90fe7ca5f5c89d7a34005c2f4dddc1cba61bad94ce5b7dfb08a1e68e25cf2f5b'
            '19b9acf45cc08a34c4c3eba79c5124e40b1adb844413e82512606126385de373f047f1b5ad431548cd8eb66a152894741adb94b99a9adb9eeb507997314e1882'
            'c1ee3925eced182ea7fffa55a6dc2a4e099ccf18636fc237ef0a2fc9517a38cfc2a819ae5a7bc546b63e383506f9f47e89454a71e34106c579d7454d71b2299e')

package() {
  cd "$srcdir"

  install -d -m 755 "${pkgdir}/var/lib/radarr"

  msg2 "Install Radarr in /usr/lib"
  install -d -m 755 "${pkgdir}/usr/lib/radarr"
  cp -dpr --no-preserve=ownership "${srcdir}/Radarr/"* "${pkgdir}/usr/lib/radarr"

  msg2 "Fixing permissions in /usr/lib/radarr/"
  find "${pkgdir}/usr/lib/radarr" -type f -exec chmod 644 '{}' ';'

  msg2 "Install radarr.service"
  install -D -m 644 "${srcdir}/radarr.service" "${pkgdir}/usr/lib/systemd/system/radarr.service"

  msg2 "Install radarr sysusers.d"
  install -Dm644 "$srcdir/radarr.sysusers" "$pkgdir/usr/lib/sysusers.d/radarr.conf"
}
