# Maintainer: Christoph Sterz <christoph.sterz@kdab.com>
pkgname=kddockwidgets-git
pkgver=1.6.0.r79.gac6ed8e9
pkgrel=1
arch=('x86_64')
pkgdesc="KDAB's Dock Widget Framework for Qt"
license=("GPL2" "custom:KDAB commercial license")
depends=(qt5-{base,x11extras})
makedepends=('cmake' 'git' 'ninja' 'qt5-tools')
url="https://www.kdab.com/kddockwidgets/"
source=("${pkgname}::git+https://github.com/KDAB/KDDockWidgets.git")
sha256sums=('SKIP')

pkgver() {
    git -C "$srcdir/$pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja \
        "../${pkgname}"
    ninja
}

package() {
    cd build
    DESTDIR="${pkgdir}" ninja install
}
