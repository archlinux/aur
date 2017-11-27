# Maintainer: kevku <kevku@gmx.com>
pkgname='xml-security-c'
pkgver='1.7.3'
pkgrel='5'
pkgdesc='C++ Implementation of W3C security standards for XML'
arch=('i686' 'x86_64')
url='http://santuario.apache.org/'
license=('Apache')
depends=('xerces-c' 'xalan-c')
source=("https://www.apache.org/dist/santuario/c-library/$pkgname-$pkgver.tar.gz.asc"
        "https://www.apache.org/dist/santuario/c-library/$pkgname-$pkgver.tar.gz"
        "xml-security-c-1.7.3_openssl1.1.patch"
        "xml-security-c-ac_fixes.patch"
        "xml-security-c-cxx11.patch")
sha256sums=('SKIP'
            'e5226e7319d44f6fd9147a13fb853f5c711b9e75bf60ec273a0ef8a190592583'
            '05de31738ccd09702309d00985a52036171bd56e9c59f7eef2a1bf08877ae5de'
            '6c40f007ea75fc66754c6deba59a96e55229ccb3998e1709e16059c019ad7c1a'
            'dc3789452a4d011c9bbd0ce58f6dfc8bf9f3d392535492d6bfc78ca5135faf08')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/xml-security-c-cxx11.patch"
  patch -p1 -i "${srcdir}/xml-security-c-ac_fixes.patch"
  patch -p1 -i "${srcdir}/xml-security-c-1.7.3_openssl1.1.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --without-nss \
    --with-openssl=/usr \
    --with-xerces=/usr \
    --with-xalan=/usr \
    --disable-debug \
    --disable-static
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
