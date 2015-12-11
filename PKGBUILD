# Maintainer: André Vitor L. Matos <andre.vmatos@gmail.com>
# Contributor: dkadioglu <denk@post.com>

pkgname=kdeplasma-applets-playbar2
_name=PlayBar2
pkgver=2.3
pkgrel=2
pkgdesc="Mpris2 Client for Plasma5"
arch=('i686' 'x86_64')
url="https://github.com/audoban/PlayBar2"
license=('GPL')
depends=('plasma-framework' 'plasma-workspace' 'kdeclarative' 'kglobalaccel'
    'kconfigwidgets' 'kxmlgui' 'kwindowsystem')
makedepends=('kdoctools' 'extra-cmake-modules')
source=("https://github.com/audoban/${_name}/archive/v${pkgver}.tar.gz"
    "fix-cmake-dataengine.patch")
md5sums=('5d3e9b623e7f6b542a94d544a362978a' '3d78ee1b295dfa8c4c9472742a266893')

prepare() {
    mkdir -p build
}

build() {
    cd ${_name}-${pkgver}
    patch -Np1 -i "${srcdir}/fix-cmake-dataengine.patch"
    cd ../build
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        ../${_name}-${pkgver}
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}

# vim: set ts=4 sws=4 sw=4 ai et
