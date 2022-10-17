# Maintainer: dingjing <dingjing@live.cn>

pkgname=jarvis
pkgver=0.0.4
pkgrel=1
pkgdesc='一款数据分析与展示平台(版本号高于 1.0.0 才可正常使用)'
url='https://github.com/dingjingmaster/jarvis'
arch=('x86_64')
license=('MIT')
depends=('openssl' 'sqlite3')
makedepends=('cmake')
source=("https://github.com/dingjingmaster/jarvis/archive/refs/tags/0.0.4.tar.gz")
sha512sums=('5f1d83b65fe77d3b49e365e3dcd517e13b7e4af74ff44d44371c72dbea67646e539aa02e46416057d7dc48cfcea8857ffd3845719c72bccd87dd578d1c190c80')

prepare() {
    cd ${srcdir}/${pkgname}-$pkgver 
    [ ! -d build ] && mkdir build
    cd build
    cmake -D DEBUG=OFF ..
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    make jarvis
}

package() {
    msg "make ${pkgname} package ..."
    cd ${srcdir}/${pkgname}-${pkgver}
    msg ${srcdir}/${pkgname}-${pkgver}

    install -dm755 "${pkgdir}/var/lib/jarvis/db/"
    install -dm755 "${pkgdir}/usr/lib/systemd/system/"
    install -dm755 "${pkgdir}/usr/local/${pkgname}/bin"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/build/app/${pkgname}              "${pkgdir}/usr/local/${pkgname}/bin/"
    install -Dm755 ${srcdir}/${pkgname}-${pkgver}/data/${pkgname}.service           "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -Dm755 ../../README.md                                                      "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm755 ../../LICENSE                                                        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
