# Maintainer: John Eivind Helset <private@jehelset.no>

_name=libassert
_author=jeremy-rifkin

pkgname=${_name}
pkgver=2.2.1
pkgrel=1
pkgdesc="The most over-engineered C++ assertion library"
arch=('x86_64')
url="https://github.com/${_author}/${_name}"
license=('MIT')

depends=('cpptrace' 'fmt')
optdepends=('fmt: libfmt integration')
makedepends=('git' 'cmake' 'make' 'cpptrace')
provides=('libassert')
conflicts=('libassert')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cmake -B build                               \
          -DBUILD_SHARED_LIBS=1                  \
          -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
          -DLIBASSERT_USE_EXTERNAL_CPPTRACE=1    \
          -S ${pkgname}
}

package() {
    cmake --build build --target install
}
