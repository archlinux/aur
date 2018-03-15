# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=heif
pkgver=3.1
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}.tar.gz")
sha512sums=('35b6d972d4cd0992cdc13b2e78ea85a447d3092b834e3bffc62788a06e3395a8e52e547d9a56ecb0ed52e7adca27f36027726e3de69f6f393a51ea16a61846b1')

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
