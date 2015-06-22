#
# PKGBUILD for xc3sprog
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=xc3sprog-svn
pkgver=0.r758
pkgrel=1
epoch=
pkgdesc="Utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs with the Xilinx Parallel Cable and other JTAG adapters"
arch=('i686', 'x86_64')
url="http://xc3sprog.sourceforge.net"
license=('GPL2')
groups=()
depends=('libusb' 'libusb-compat' 'libftdi' 'libftdi-compat' 'libftd2xx')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(svn+http://svn.code.sf.net/p/xc3sprog/code/trunk)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/trunk"
}

build() {
  cd "$srcdir/trunk"
  mkdir _build
  cd _build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..
  make
}

check() {
  cd "$srcdir/trunk/_build"
}

package() {
  cd "$srcdir/trunk/_build"
  make DESTDIR="$pkgdir/" install
  cd "$srcdir/trunk"
  install -Dm0644 xc3sprog.1 "$pkgdir/usr/local/share/man/man1/xc3sprog.1"
}

# EOF
