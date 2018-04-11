# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=heif
pkgver=3.2.1
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}.tar.gz")
sha512sums=('a36fc6cc6c5bd054fd7a152114302464db8e587f89db97f2c8d32369f3926198a6c9fa643faf056cd56e7c5fc07d1277cc270eb51a6fba27e6af2bbb8e6c26f0')

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
