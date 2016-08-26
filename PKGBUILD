# Maintainer: montag451 <montag451 [at] laposte (dot) net>

pkgname=asn1c
pkgver=0.9.27
pkgrel=3
pkgdesc='Open Source ASN.1 Compiler'
arch=('i686' 'x86_64')
url='http://lionet.info/asn1c/compiler.html'
license=('BSD')
depends=('glibc')
source=("http://lionet.info/soft/asn1c-${pkgver}.tar.gz")
sha512sums=('ac010087cb1412ba766463e2b93163e2fbd17556446a28a3e4a010bef1123881b1366827b0f8e612a7450f4bb92e959cdb4ac898d7015922485045e0b6e12e92')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    install -m 644 -D -t "${pkgdir}/usr/share/${pkgname}/standard-modules" skeletons/standard-modules/*
    install -m 644 -D COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
