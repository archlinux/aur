# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=heif
pkgver=3.4.0
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}.tar.gz")
sha512sums=('e99540605279c70684809e642b5f6ee24689f59f49149e129811117b0137b6896f2aea2db3af2bf37ebfb1f8b41903eaf87bc60366b012a9099fd898ddf8387a')

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
