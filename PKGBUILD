# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-appswitcher
pkgname=$_pkgname-git
pkgver=1.0.r27.g131d895
pkgrel=1
pkgdesc="Third party, more feature rich application switcher."
arch=("i686" "x86_64")
url="https://github.com/zjes/lxqt-appswitcher"
license=('LGPL2.1')
depends=("lxqt-globalkeys")
makedepends=("git" "cmake" "qt5-tools" "lxqt-build-tools-git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    mkdir -p build && cd build
    cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
