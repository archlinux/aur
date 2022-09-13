# Maintainer: Robinhuett <aur at tripp dot xyz>
# Contributor: Neal <neal.oakey at oakey-dev dot de>

pkgname=ecdsautils
arch=(i686 x86_64)
pkgver=0.4.1
pkgrel=1
pkgdesc="Tiny collection of programs used for ECDSA (keygen, sign, verify)"
makedepends=('cmake')
depends=('glibc' 'libuecc>=6')
url="https://github.com/freifunk-gluon/ecdsautils"
license=('BSD')

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('6fd827b3070afddc9e31f37f1d805f54aabf8518d2310c5c2b26cc8eb53555a8')

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

