# Maintainer: louis.seubert.ls@gmail.com <Louis Seubert>

pkgname=plasma5-runners-jetbrains-runner
pkgver=1.1.1
pkgrel=1
pkgdesc="A Krunner Plugin which allows you to open your recent projects"
arch=("any")
url="https://github.com/alex1701c/JetBrainsRunner"
license=("LGPL-3.0")
depends=('krunner' 'qt5-base')
makedepends=('cmake' 'extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alex1701c/JetBrainsRunner/archive/${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=("bf9329e171c50a6d651b649ada68184fc7e8562e36743f898ce74b1aebe4a3af")

pkgver() {
    printf "%s" "$pkgver"
}

prepare() {
    mkdir build
    mkdir -p ${pkgname}-${pkgver}
    tar xzf ${noextract} -C ${pkgname}-${pkgver} --strip-components 1
}

build() {
    cd build
    cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` -DQT_PLUGIN_INSTALL_DIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd build
    make install DESTDIR="${pkgdir}"
}
