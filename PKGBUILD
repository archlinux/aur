# Maintainer: Robinhuett <aur at tripp dot xyz>
# Contributor: Neal <neal.oakey at oakey-dev dot de>

pkgname=ecdsautils
arch=(i686 x86_64)
pkgver=0.4.0
pkgrel=1
_commit=07538893fb6c2a9539678c45f9dbbf1e4f222b46
pkgdesc="Tiny collection of programs used for ECDSA (keygen, sign, verify)"
makedepends=('cmake')
depends=('glibc' 'libuecc>=6')
url="https://github.com/tcatm/ecdsautils"
license=('BSD')

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/tcatm/ecdsautils/archive/${_commit}.tar.gz)
sha256sums=('f244eda4dc55dcf16b687ed9fd1935500569e2e1a7d02873e6d1bcb5df418026')

build() {
  rm -rf "$srcdir/build"
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr "../${pkgname}-${_commit}"
  make
}

package() {
  cd "$srcdir/build"
  make install DESTDIR="${pkgdir}"
}
