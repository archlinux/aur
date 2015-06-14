# Maintainer: kevku <kevku@gmx.com>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>

pkgname='xml-security-c'
pkgver='1.7.3'
pkgrel='2'
pkgdesc='C++ Implementation of W3C security standards for XML'
arch=('i686' 'x86_64')
url='http://santuario.apache.org/'
license=('GPL')
depends=('xalan-c')
source=("http://www.apache.org/dist/santuario/c-library/$pkgname-$pkgver.tar.gz"
        "http://www.apache.org/dist/santuario/c-library/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('e5226e7319d44f6fd9147a13fb853f5c711b9e75bf60ec273a0ef8a190592583'
            'SKIP')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p xsec/yes/lib
  sed -i -e 's/-O2 -DNDEBUG/-DNDEBUG/g' configure
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --with-openssl \
    --with-xerces \
    --with-xalan \
    --disable-static
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
