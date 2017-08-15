# Maintainer: chliny <chliny11 at gmail dot com>

pkgname=openlte
_pkgver=v00-20-05
pkgver=v00_20_05
pkgrel=1
pkgdesc="An open source 3GPP LTE implementation."
arch=('any')
url="http://openlte.sourceforge.net"
license=('GPL' 'AGPL')
depends=('gnuradio' 'gnuradio-osmosdr' 'libuhd' 'bladerf' 'mbedtls')
#optdepends=('git')
install=openlte.install
source=(
    "https://sourceforge.net/projects/${pkgname}/files/${pkgname}_${_pkgver}.tgz"
    "${pkgname}.patch"
    )
sha512sums=(
    'SKIP'
    '8238256add59aad3ec2752a9afa231036e8eb5f54ada3c13f42044ea84af96cecc9ec8bbb7b795d2f8dc7e6deb53df3efa0c1b335bad6f7e7e543b71f0731619'
    )

build() {
    cd "${srcdir}/${pkgname}_${_pkgver}"
    patch -p1 < ../../${pkgname}.patch
    mkdir -p build
    mkdir -p install
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=../install ../
    make && make install
}

package() {
    cd "${srcdir}/${pkgname}_${_pkgver}/install"

    mkdir -p "${pkgdir}/usr/share/${pkgname}"

    mv bin "${pkgdir}/usr/"
    mv include "${pkgdir}/usr/"
    mv lib "${pkgdir}/usr/"

    install -Dm755 ../enodeb_nat_script.sh  "${pkgdir}/usr/share/${pkgname}"
    install -Dm755 ../README "${pkgdir}/usr/share/${pkgname}"
}
