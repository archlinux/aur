pkgname=ecdsautils
arch=(i686 x86_64)
pkgver=0.3.2
pkgrel=1
pkgdesc="Tiny collection of programs used for ECDSA (keygen, sign, verify)"
makedepends=('cmake' 'libuecc>=3')
depends=('glibc')
url="https://github.com/tcatm/ecdsautils"
license=('BSD')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${_pkgver}")

source=(https://github.com/tcatm/ecdsautils/archive/v${pkgver}.tar.gz)
sha256sums=('a828417c985ccfc623bb613e92ccc8af6c6f24a5bcab8b112b90c033a816204f')

build() {
  rm -rf "$srcdir/build"
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr "../${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/build"
  make install DESTDIR="${pkgdir}"
}
