# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=kbackup
pkgver=1.0
pkgrel=1
pkgdesc="Backup program for KDE"
arch=('i686' 'x86_64')
url="http://members.aon.at/m.koller/"
license=('GPL')
depends=('plasma-framework')
makedepends=('kdoctools' 'kdelibs4support' 'kdesignerplugin' 'extra-cmake-modules')
source=("http://members.aon.at/m.koller/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('cfa27bbc26a66aef07512f6bae9e73125f39f79bb0a337c1033e01852b895134')


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    rm -rf build
    mkdir build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr || return 1
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    make DESTDIR=${pkgdir} install || return 1
}
