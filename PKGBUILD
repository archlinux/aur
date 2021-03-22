pkgname=opensaml
pkgver=3.2.0
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
sha256sums=('cd3716a91b9affe72ee5c3116990081f44c7e6b08e3a766c2a8811727475efbe'
            'SKIP')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "$pkgname-$pkgver"
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
