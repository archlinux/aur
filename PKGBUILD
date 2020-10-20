# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>
_name=umps
_ver=3
pkgname=$_name$_ver-git
pkgver=3.0.3.r0.gfd6086e
pkgrel=1
pkgdesc="Virtual machine simulator based around the MIPS R2/3000 microprocessor."
arch=('x86_64')
url="https://github.com/virtualsquare/umps3"
license=('GPL3')
makedepends=('git' 'cmake' 'qt5-base' 'libelf' 'boost' 'libsigc++' 'cross-mipsel-linux-gnu-gcc')
optdepends=('cross-mipsel-linux-gnu-gcc: compile programs for uMPS')
conflicts=('umps3')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $pkgname \
  	-DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
