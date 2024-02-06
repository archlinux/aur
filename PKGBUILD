# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=libdisplay-info-git
pkgver=0.1.1.r24.gebee359
pkgrel=1
pkgdesc='EDID and DisplayID library'
url='https://gitlab.freedesktop.org/emersion/libdisplay-info'
arch=('x86_64')
license=('MIT')
source=("git+$url")
sha1sums=('SKIP')
makedepends=(git hwdata meson ninja python)
conflicts=(libdisplay-info)
provides=(libdisplay-info libdisplay-info.so)

pkgver() {
  git -C libdisplay-info describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson libdisplay-info build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "libdisplay-info/LICENSE"
}
