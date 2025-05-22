# Maintainer: Ash <xash at riseup d0t net>
pkgname="mpv-reload-git"
pkgver=r17.60e6fb1
pkgrel=1
pkgdesc="A userscript for MPV that provides automatic reloading of videos based on buffering progress and allows manual reload with Ctrl+r."
arch=('any')
url="https://github.com/4e6/mpv-reload"
license=('MIT')
depends=('mpv')
makedepends=('git')
provides=('mpv-reload')
conflicts=('mpv-reload')
source=("git+https://github.com/4e6/mpv-reload.git"
        "reload.conf"
)
md5sums=('SKIP'
         '9a83a0fcc88e778ef7531770f82d4e33'
)

pkgver() {
  cd "${srcdir}/mpv-reload"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mpv-reload"
  
  # Install reload.lua script
  install -Dm 644 "main.lua" "$pkgdir/etc/mpv/scripts/reload.lua"
  
  # Install the default config file (from the README.md)
  install -Dm 644 "$srcdir/reload.conf" "$pkgdir/etc/mpv/script-opts/reload.conf"

  # Install LICENSE
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
