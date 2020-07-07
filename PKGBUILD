# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-thermal-monitor
pkgver=1.2.9
pkgrel=3
pkgdesc="Plasma applet for monitoring temperatures of existing sensors including CPU, GPU and HDD."
arch=(any)
url="https://github.com/kotelnik/plasma-applet-thermal-monitor"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects)
makedepends=(extra-cmake-modules)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${url}/commit/b389b886a7ee759d06c9eb0e6a3b6abbea400035.patch")
sha256sums=('b665025a4c22a33244b9c8bf87cdc26080715225a56ae46beefda4c8cad8520d'
            '9d2ce31a47ff9400040814d18be08503372ab9f2a8282c76dee8a0e4432814e8')

prepare() {
    mkdir -p build
    cd plasma-applet-thermal-monitor-${pkgver}
    patch -p1 -i ../b389b886a7ee759d06c9eb0e6a3b6abbea400035.patch
}

build() {
    cd build
    cmake ../plasma-applet-thermal-monitor-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
