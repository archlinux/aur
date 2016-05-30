# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: ovi chis <ovi@ovios.org>

pkgname=libqb
pkgver=1.0
pkgrel=1
pkgdesc='Library with the primary purpose of providing high performance client server reusable features'
arch=("i686" "x86_64" "mips64el")
makedepends=("doxygen" "splint")
license=("LGPL2.1")
options=(!libtool)
url="https://github.com/asalkeld/${pkgname}/wiki"
source=("https://github.com/asalkeld/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e4eb3e487af7ae8f1a8472b9f3bf09a02db6b67c4f723bfc48c5f14074d5cd31e87a7f7d2a82f46049a06685ce7d87a404f42fcb6352b83d3ba0d64c566f9f0b')

build() {
cd ${srcdir}/${pkgname}-${pkgver}
  setarch ${CARCH} ./autogen.sh
  setarch ${CARCH} ./configure --prefix=/usr\
    --disable-fatal-warnings\
    --disable-static\
    --libdir=/usr/lib\
    --sbindir=/usr/bin
  setarch ${CARCH} make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  setarch ${CARCH} make DESTDIR=${pkgdir} install
}
