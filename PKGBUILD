# Maintainer: kevku <kevku@gmx.com>
pkgname='xml-security-c'
pkgver='2.0.2'
pkgrel='3'
pkgdesc='C++ Implementation of W3C security standards for XML'
arch=('i686' 'x86_64')
url='http://santuario.apache.org/'
license=('Apache')
depends=('xerces-c' 'xalan-c')
source=("https://www.apache.org/dist/santuario/c-library/$pkgname-$pkgver.tar.bz2.asc"
        "https://www.apache.org/dist/santuario/c-library/$pkgname-$pkgver.tar.bz2"
        "xalan-c-1.12.patch")
sha256sums=('SKIP'
            '39e963ab4da477b7bda058f06db37228664c68fe68902d86e334614dd06e046b'
            'fe009b1cadcbce62015229138ab9a8a07981264e802213d0888c281538748907')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/xalan-c-1.12.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --without-nss \
    --with-openssl=/usr \
    --disable-debug \
    --disable-static
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
