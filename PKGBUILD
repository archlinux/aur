pkgname=xmltooling
pkgver=3.3.0
pkgrel=2
pkgdesc="Shibboleth Project's XML processing library"
url="https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2067398797/XMLTooling-C"
license=(Apache)
arch=(x86_64)
depends=(
  curl
  gcc-libs
  log4shib
  openssl
  xerces-c
  xml-security-c
  zlib
)
makedepends=(
  boost
  doxygen
)
# Git: git+https://git.shibboleth.net/git/cpp-xmltooling
source=("https://shibboleth.net/downloads/c++-opensaml/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/c++-opensaml/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('1a8a4eb6e48e7eb3546966ed025bfcb785b0d78e14225086fa4eb00eba4d0952'
            'SKIP')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "$pkgname-$pkgver"
  export CXXFLAGS+=" -std=gnu++14"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et:
