# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=heif
pkgver=3.2
pkgrel=1
pkgdesc='High Efficiency Image File Format'
arch=('x86_64' 'i686')
url='https://nokiatech.github.io/heif/'
license=('custom')
makedepends=('cmake')
source=("https://github.com/nokiatech/heif/archive/v${pkgver}.tar.gz")
sha512sums=('bdd86749a858a888a26f893951f531d5f1292e5c4030f209987042d46b0843025a09aa0e018a3cc2cc98b089ef4aaca8b2a40d8c2f601a533b03d71d84726c76')

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
