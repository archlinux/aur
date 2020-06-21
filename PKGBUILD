# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gresg
pkgver=0.4.0+9+g207aa8b
pkgrel=1
pkgdesc="XML resources generator"
arch=(x86_64)
url="https://gitlab.com/pwmc/gsvg"
license=(GPL3)
depends=(gxml)
makedepends=(git meson vala)
_commit=207aa8ba0e5fa3c5d3236ffb1783cc5a20e8842a  # master~2
source=("git+https://gitlab.com/esodan/gresg#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
