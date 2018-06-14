# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=heif
pkgver=3.3.0
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}.tar.gz")
sha512sums=('6a93651feda8e3bbb112eb06e5e1370506d8b8a6de641ecc439a61928081ab38e6399fc890e053b3c4a3c392f8cba6a20a25db23ae51f9a67496355d7239ba2c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/build/"
    cmake ../srcs
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/lib/heif/"

    install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r srcs/api "${pkgdir}/usr/lib/heif/"

    cd build/lib/
    install -Dm644 -t "${pkgdir}/usr/lib/" ./*
}
