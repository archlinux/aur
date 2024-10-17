pkgname=opensaml
pkgver=3.3.0
pkgrel=1
pkgdesc="Shibboleth Project's SAML 2 implementation in C++"
url="https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2067398807/OpenSAML-C"
license=(Apache)
arch=(x86_64)
depends=(
  log4shib
  xerces-c
  xml-security-c
  xmltooling
)
makedepends=(
  boost
  doxygen
)
# Git: git+https://git.shibboleth.net/git/cpp-opensaml
source=("https://shibboleth.net/downloads/c++-opensaml/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/c++-opensaml/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('436316e5bf60f0c631b7d539ac63d4cc1fcb93f54c29e1a7fe613978dc9abfad'
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

  # Remove demo tools
  rm -f "$pkgdir"/usr/bin/samlsign
}

# vim: ts=2:sw=2:et:
