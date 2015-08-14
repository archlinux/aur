# Maintainer: Garrett <floft.net/contact>
pkgname=libdrng
pkgver=1.0
pkgrel=1
pkgdesc="Intel library for rdrand and rdseed instructions"
arch=('i686' 'x86_64')
url="https://software.intel.com/en-us/articles/the-drng-library-and-manual"
license=('BSD')
source=("https://software.intel.com/sites/default/files/managed/89/f5/$pkgname-$pkgver.tar.gz" "drng.pc")
md5sums=('507ec88510b6d8d77d171b402ae08335'
         '62535e6fdcfd245e9bab66142ab8755f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/config\.h/drng_&/g" "drng.h"
    install -Dm0644 "drng.h" "${pkgdir}/usr/include/drng.h"
    install -Dm0644 "config.h" "${pkgdir}/usr/include/drng_config.h"
    install -Dm0644 "${pkgname}.a" "${pkgdir}/usr/lib/${pkgname}.a"
    install -Dm0644 "${srcdir}/drng.pc" "${pkgdir}/usr/share/pkgconfig/drng.pc"
}
