# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-appswitcher
pkgname=$_pkgname-git
pkgver=r61.2a3e41e
pkgrel=1
pkgdesc="Third party, more feature rich application switcher."
arch=("i686" "x86_64")
url="https://github.com/zjes/lxqt-appswitcher"
license=('LGPL2.1')
depends=("lxqt-globalkeys-git")
makedepends=("git" "cmake" "qt5-tools" "lxqt-build-tools-git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/zjes/lxqt-appswitcher.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
