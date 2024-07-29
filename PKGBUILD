# Maintainer: Ash <xash at riseup d0t net>
pkgname="mpv-reload-git"
pkgver=r16.1a6a938
pkgrel=2
pkgdesc="A userscript for MPV that provides automatic reloading of videos based on buffering progress and allows manual reload with Ctrl+r."
arch=('any')
url="https://github.com/4e6/mpv-reload"
license=('MIT')
depends=('mpv')
makedepends=('git')
provides=('mpv-reload')
conflicts=('mpv-reload')
source=("git+https://github.com/4e6/mpv-reload.git")
md5sums=('SKIP'
         '768b97aae81cdaa74392d602b9e95ddcdaac6cab61e0ea2f7fb1f1ab4c2f1d40')

pkgver() {
  cd "${srcdir}/mpv-reload"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mpv-reload"
  
  # Install reload.lua script
  install -Dm 644 "reload.lua" "$pkgdir/etc/mpv/scripts/reload.lua"
  
  # Install the default config file (from the README.md)
  install -Dm 644 "reload.conf" "$pkgdir/etc/mpv/script-opts/reload.conf"

  # Install LICENSE
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
