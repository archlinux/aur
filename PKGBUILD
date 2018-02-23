# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgbase=('libdecaf')
pkgname=('libdecaf')
pkgver='0.9.4'
pkgrel=1
pkgdesc="A 448-bit Edwards curve"
url="https://sourceforge.net/projects/ed448goldilocks/"
depends=()
makedepends=()
license=('MIT')
arch=('i686' 'x86_64')
source=("https://sourceforge.net/projects/ed448goldilocks/files/$pkgname-$pkgver.tgz")
sha256sums=('6b0b6dc77a8dec88ea5b45902f8211d9f6c55b3346191dcd0aaeeb45a8d23f7f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make lib 
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D build/lib/libdecaf.so.1 "${pkgdir}/usr/lib/libdecaf.so.1"
    ln -sr ${pkgdir}/usr/lib/libdecaf.so{.1,}
    install -d "${pkgdir}/usr/include/decaf"
    install -D -m644 src/GENERATED/include/decaf/*.{h,hxx} "${pkgdir}/usr/include/decaf/"
    install -D -m644 src/GENERATED/include/*.{h,hxx} "${pkgdir}/usr/include"
}
