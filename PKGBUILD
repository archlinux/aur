# Maintainer: Greizgh <greizgh@ephax.org>
pkgname=ugtrain-git
pkgver=v0.4.r6.54ec737
pkgrel=1
pkgdesc="The Universal Elite Game Trainer for CLI"
arch=('i686' 'x86_64')
url="https://github.com/ugtrain/ugtrain"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git')
provides=(ugtrain)
source=(git://github.com/ugtrain/ugtrain.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ugtrain"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/ugtrain"
  ./autogen.sh
}

build() {
  cd "$srcdir/ugtrain"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/ugtrain"
  make -k check
}

package() {
  cd "$srcdir/ugtrain"
  make DESTDIR="$pkgdir/" install
}
