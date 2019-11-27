# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>
pkgname=umps-git
pkgver=2.0.1.r7.g7539d30
pkgrel=1
pkgdesc="Virtual machine simulator based around the MIPS R2/3000 microprocessor."
arch=('x86_64')
url="http://mps.sourceforge.net/"
license=('GPL2')
depends=('qt4' 'libelf' 'boost' 'libsigc++' "cross-mipsel-linux-gnu-gcc")
makedepends=('git' 'autoconf' 'make')
source=("$pkgname::git+https://github.com/tjonjic/umps.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  autoreconf -fi
  ./configure --enable-maintainer-mode --with-mips-tool-prefix=mipsel-linux-gnu-
  make
}

check() {
  cd "$pkgname"
  make -k check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
