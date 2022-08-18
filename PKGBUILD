# Maintainer: solopasha <daron439@gmail.com>
pkgname=mpv_inhibit_gnome
pkgver=r19.6f192eb
pkgrel=1
pkgdesc="mpv plugin that prevents screen blanking in GNOME"
arch=('x86_64')
url="https://github.com/Guldoman/mpv_inhibit_gnome"
license=('MIT')
depends=(mpv dbus)
makedepends=(git)
source=("$pkgname::git+$url.git")
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
  install -Dm644 "$pkgname/bin/mpv_inhibit_gnome.so" -t "$pkgdir/etc/mpv/scripts"
}

