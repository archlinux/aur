# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: mizux <webmaster@mizux.net>
# Contributor: Peter Simons <simons@cryp.to>
pkgname=mscgen
pkgver=0.20
pkgrel=4
pkgdesc="Message Sequence Chart Generator"
arch=('i686' 'x86_64')
url='http://www.mcternan.me.uk/mscgen/'
license=('GPL')
depends=('gd')
makedepends=()
options=()
source=("http://www.mcternan.me.uk/mscgen/software/$pkgname-src-$pkgver.tar.gz"
        "debian-width-never-less-than-zero.patch")
sha256sums=('3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d8551ddc23'
            '690f8c1bd3a2e0ce7dbfa1297dbc56145427361563c9a0b4b07f044a007a0511')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/debian-width-never-less-than-zero.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-freetype
  make all
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
