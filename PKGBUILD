# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>
_name=umps
_ver=2
pkgname=$_name$_ver
pkgver=2.0.1
pkgrel=3
pkgdesc="Virtual machine simulator based around the MIPS R2/3000 microprocessor."
arch=('x86_64')
url="http://mps.sourceforge.net/"
license=('GPL')
makedepends=('autoconf' 'make' 'qt4' 'libelf' 'boost' 'libsigc++' 'cross-mipsel-linux-gnu-gcc')
optdepends=('cross-mipsel-linux-gnu-gcc: compile programs for µMPS')
conflicts=('umps2-git')
source=("https://sourceforge.net/projects/mps/files/uMPS2/$_name-$pkgver.tar.gz"
        "0001-upstream-fixes.patch")
md5sums=('60b72c2f8e2e5ab58de4277649e5e4ce'
         'b8145ca1b9a4db35adb1fb2f43eabc5f')

prepare() {
  cd "$_name-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-upstream-fixes.patch"
}

build() {
  cd "$_name-$pkgver"
  autoreconf -fi
  ./configure --enable-maintainer-mode --with-mips-tool-prefix=mipsel-linux-gnu-
  make
}

check() {
  cd "$_name-$pkgver"
  make -k check
}

package() {
  cd "$_name-$pkgver"
  make DESTDIR="$pkgdir/" install
}
