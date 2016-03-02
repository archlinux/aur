# Maintainer: Michael Straube <m.s.online gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.4
pkgrel=3
pkgdesc='A computer game of the "falling blocks" type, but with unique features'
arch=('i686' 'x86_64')
url="http://www.nongnu.org/galois/"
license=('GPL3')
depends=('gtkmm' 'libxml++')
source=("http://download.savannah.gnu.org/releases/galois/source/galois-${pkgver}.tar.gz"
        "fix-install-path.patch")
md5sums=('dc80a8cac1aee42a66b7f992ac593bf5'
         '5d888b0110fa18f1dcbc62da1286e6b8')

prepare() {
  cd "${srcdir}"
  patch -p0 < fix-install-path.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
