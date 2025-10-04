# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=vali-git
pkgver=v0.1.0.r0.g9a0c965
pkgrel=1
pkgdesc='C library and code generator for Varlink'
url='https://gitlab.freedesktop.org/emersion/vali'
arch=('x86_64')
license=('MIT')
source=("git+$url.git")
sha1sums=('SKIP')
depends=(json-c aml)
makedepends=(git meson ninja)
conflicts=(vali)
provides=(vali vali.so)

pkgver() {
  git -C vali describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson vali build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "vali/LICENSE"
}
