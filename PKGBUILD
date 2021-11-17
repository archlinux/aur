pkgname=opensaml
pkgver=3.2.1
pkgrel=1
pkgdesc="Shibboleth Project's SAML 2 implementation in C++"
url="https://wiki.shibboleth.net/confluence/display/OpenSAML/Home"
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
source=("https://shibboleth.net/downloads/c++-opensaml/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://shibboleth.net/downloads/c++-opensaml/$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('a54ffb2a5831902678909c14aa48b40d35e03e8852fd85aba646c9f5b5e32ac5'
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
