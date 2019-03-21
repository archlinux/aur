# Maintainer: Jianqiu Zhang <void001@archlinuxcn.org>


pkgname=kcm-colorful-git
pkgrel=1
pkgver=0.9.6.r0.g22ffde1
pkgdesc='Make your KDE plasma colorful'
arch=('x86_64')
url="https://github.com/IsoaSFlus/kcm-colorful"
license=('GPL2')
depends=('systemsettings' 'kcolorchooser')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'qt5-base' 'frameworkintegration' 'kcmutils')

source=(
    "kcm-colorful::git+https://github.com/IsoaSFlus/kcm-colorful"
)

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/kcm-colorful
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"/kcm-colorful
    git submodule init
    git submodule update
}

build() {
    cd $srcdir/kcm-colorful
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_INSTALL_LIBDIR="lib" \
          -DBUILD_TESTING=OFF \
        ..
    make
}

package() {
    cd $srcdir/kcm-colorful/build
    make DESTDIR="$pkgdir/" install
}
