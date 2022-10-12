# Maintainer: solopasha <daron439@gmail.com>
pkgname=mpv_inhibit_gnome
pkgver=v0.1.3.r0.g9069be0
pkgrel=1
pkgdesc="mpv plugin that prevents screen blanking in GNOME"
arch=('x86_64')
url="https://github.com/Guldoman/mpv_inhibit_gnome"
license=('MIT')
depends=(mpv dbus)
makedepends=(git)
_commit=9069be0f15fa2c222d78a183d4aa1477d8a8f2cd
source=("$pkgname::git+$url.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
  make
}

package() {
  install -Dm755 "$pkgname/lib/mpv_inhibit_gnome.so" -t "$pkgdir/etc/mpv/scripts"
}
