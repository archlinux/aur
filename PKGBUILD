# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-resources-monitor
pkgname=plasma5-applets-resources-monitor
_pkgver="2.9.0"
pkgver="${_pkgver/-/_}"
pkgrel=3
pkgdesc="Plasma 5 applet for monitoring CPU and RAM"
arch=('any')
url="https://www.pling.com/p/1527636/"
license=('GPL')
depends=(
    'libksysguard'
    'plasma-workspace'
    'qt5-graphicaleffects'
)
optdepends=()
makedepends=(
    'extra-cmake-modules'
    'kdelibs4support'
)
source=("https://github.com/orblazer/${_upstream_name}/archive/v${_pkgver}.tar.gz")
sha256sums=('c1832e0b40f35826a8b650488a0f7ee84adb436ff00ef55b602336bc7e24a2fd')

build() {
    cd "$srcdir/$_upstream_name-$_pkgver"
    mkdir -p build
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX="$(kf5-config --prefix)" \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/$_upstream_name-$_pkgver"
    DESTDIR="${pkgdir}" cmake --install build
}
