# Maintainer: Drosera Sprout <droserasprout@tuta.io
# Contributor: André Vitor L. Matos <andre.vmatos@gmail.com>
# Contributor: dkadioglu <denk@post.com>
_pkgname=plasma5-applets-playbar2-bigcover
pkgname=${_pkgname}-git
pkgver=v2.3.r3.gd832a31
pkgrel=1
pkgdesc="Mpris2 Client for Plasma5"
arch=('i686' 'x86_64')
url="https://github.com/droserasprout/${_pkgname}"
license=('GPL')
depends=('plasma-framework' 'plasma-workspace' 'kdeclarative' 'kglobalaccel'
    'kconfigwidgets' 'kxmlgui' 'kwindowsystem')
makedepends=('git' 'kdoctools' 'extra-cmake-modules')
conflicts=('kdeplasma-applets-playbar2')
source=("git+https://github.com/droserasprout/${_pkgname}.git#branch=master") 
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p build
}

build() {
    cd "../src/build"
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        ../${_pkgname}
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}

# vim: set ts=4 sws=4 sw=4 ai et
