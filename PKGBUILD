# Maintainer: dingjing <dingjing@live.cn>

pkgname=jarvis
pkgver=0.0.6
pkgrel=1
pkgdesc='一款数据分析与展示平台(版本号高于 1.0.0 才可正常使用)'
url='https://github.com/dingjingmaster/jarvis'
arch=('x86_64')
license=('MIT')
depends=('openssl' 'sqlite3')
makedepends=('cmake')
source=("https://github.com/dingjingmaster/jarvis/archive/refs/tags/0.0.6.tar.gz")
sha512sums=('994ebcd22891143341de14c3dce4d8f48584ca33af277d3128a2dc9b02fd7309d6bc771e0c27361c44608b9d9ab3eafed24a58d3a2c867f4ffa82a0f9732758a')

prepare() {
    cd ${srcdir}/${pkgname}-$pkgver 
    [ ! -d build ] && mkdir build
    cd build
    cmake -D DEBUG=OFF ..
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    make -j8 
}

package() {
    msg "make ${pkgname} package ..."
    cd ${srcdir}/${pkgname}-${pkgver}
    msg ${srcdir}/${pkgname}-${pkgver}

    install -dm755 "${pkgdir}/var/lib/jarvis/db/"
    install -dm755 "${pkgdir}/usr/lib/systemd/system/"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -dm755 "${pkgdir}/usr/local/${pkgname}/bin"
    install -dm744 "${pkgdir}/usr/local/${pkgname}/html"
    install -dm744 "${pkgdir}/usr/local/${pkgname}/html/js"

    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/data/html/index.html               "${pkgdir}/usr/local/${pkgname}/html/"
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/data/html/js/main.js               "${pkgdir}/usr/local/${pkgname}/html/js"

    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/build/app/${pkgname}              "${pkgdir}/usr/local/${pkgname}/bin/"
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/build/tools/gold-tool              "${pkgdir}/usr/local/${pkgname}/bin/"
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/tools/gold-tool.py                 "${pkgdir}/usr/local/${pkgname}/bin/"
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/tools/au-sge.py                    "${pkgdir}/usr/local/${pkgname}/bin/"
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/data/${pkgname}.service           "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"


    install -Dm755 ../../README.md                                                      "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm755 ../../LICENSE                                                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
