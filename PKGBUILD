# Maintainer: Robinhuett <aur at tripp dot xyz>
# Contributor: Neal <public-aur at oakey-net dot de>

pkgname=ecdsautils
arch=(i686 x86_64)
pkgver=0.4.2
pkgrel=1
pkgdesc="Tiny collection of programs used for ECDSA (keygen, sign, verify)"
makedepends=('cmake')
depends=('glibc' 'libuecc>=6')
url="https://github.com/freifunk-gluon/ecdsautils"
license=('BSD')

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('8880e5a506555a06d7a866de8a76c28bb4c7472abbf0d3fb396100d16c447174')

build() {
  rm -rf "$srcdir/build"
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -D CMAKE_POLICY_VERSION_MINIMUM=3.18 -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr "../${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/build"
  make install DESTDIR="${pkgdir}"
}

