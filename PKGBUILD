# Maintainer: kevku <kevku@gmx.com>
pkgname='xml-security-c'
pkgver='2.0.1'
pkgrel='1'
pkgdesc='C++ Implementation of W3C security standards for XML'
arch=('i686' 'x86_64')
url='http://santuario.apache.org/'
license=('Apache')
depends=('xalan-c')
source=("https://www.apache.org/dist/santuario/c-library/$pkgname-$pkgver.tar.bz2.asc"
        "https://www.apache.org/dist/santuario/c-library/$pkgname-$pkgver.tar.bz2")
sha256sums=('SKIP'
            'e7e9ccb8fd9d67eb1b981b191c724112f0b45f5b601f5fcc64708ebd6906e791')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --without-nss \
    --with-openssl=/usr \
    --with-xalan=/usr \
    --disable-debug \
    --disable-static
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
