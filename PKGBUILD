# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-thermal-monitor
pkgver=1.2.7
pkgrel=1
pkgdesc="Plasma applet for monitoring temperatures of existing sensors including CPU, GPU and HDD."
arch=('any')
url="https://github.com/kotelnik/plasma-applet-thermal-monitor"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('extra-cmake-modules')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz"
        "remove-spammer.patch")
sha256sums=('09a66d02ddd658eee0b8aeea02fb8e305da3f057b436cfb6b8ad8454ebbd1ca2'
            'aa411a4b53fa81815cc2bc17c6818e5ebcd7646eda87b51cc829f4e5fef37385')

prepare() {
    mkdir -p build
    cd plasma-applet-thermal-monitor-${pkgver}
    patch -p1 -i ../remove-spammer.patch
}

build() {
    cd build

    cmake ../plasma-applet-thermal-monitor-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install
}
