# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=mmwm-git
pkgver=r109.a454c08
pkgrel=1
pkgdesc="Modern Minimalistic Window Manager (git)"
url="https://github.com/kaugm/mmwm"
arch=('i686' 'x86_64')
license=('custom:MIT/X')
depends=('libx11' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  mv config.def.h config.h
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
