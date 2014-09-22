# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: MTsoul
# https://github.com/zizzfizzix/pkgbuilds

pkgname=websocketpp
pkgver=0.3.0
pkgrel=1
pkgdesc='C++/Boost Asio based websocket client/server library'
url='http://www.zaphoyd.com/websocketpp/'
license=('BSD')
arch=('any')
makedepends=('cmake')
source=("https://github.com/zaphoyd/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('094a3fd13c160e371f7aa8509556075b')

prepare() {
    if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
    mkdir ${srcdir}/${pkgname}-${pkgver}-build

    cd ${srcdir}/${pkgname}-${pkgver}-build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          ../${pkgname}-${pkgver}
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}-build
    make DESTDIR=${pkgdir} install
    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
