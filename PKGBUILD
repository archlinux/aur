# Maintainer: Tinu Weber <takeya@bluewin.ch>

pkgname=cc-tool-git
pkgver=r9.f0c4858
pkgrel=1
pkgdesc="Support for Texas Instruments CC Debugger"
arch=('x86_64')
url='https://github.com/dashesy/cc-tool.git'
license=('GPL')
makedepends=('git')
depends=('boost>=1.39.0')
source=('git+https://github.com/dashesy/cc-tool.git')
md5sums=('SKIP')
conflicts=('cc-tool')
provides=('cc-tool')

pkgver() {
  cd "$srcdir/cc-tool"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/cc-tool"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/cc-tool"
  make -k check
}

package() {
  cd "$srcdir/cc-tool"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
