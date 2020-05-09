# Maintainer: Timo Wilken <timo.21.wilken+aur@gmail.com>
_pkgname=akonadi-decsync-resource
pkgname="$_pkgname-git"
pkgver=r40.278a637
pkgrel=1
pkgdesc="Getting KDE's Akonadi to use DecSync for contacts, calendars and RSS."
arch=(x86_64)
url="https://github.com/TimoWilken/$_pkgname"
license=(GPL3)
provides=("$_pkgname")
depends=(qt5-base ki18n libdecsync libakonadi kconfig)
optdepends=()
makedepends=(cmake extra-cmake-modules)
source=("git+https://github.com/TimoWilken/$_pkgname")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf 'r%d.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cmake -S . -B build \
          -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" \
          -DCMAKE_BUILD_TYPE=Release
    cd build
    make
}

package() {
    cd "$srcdir/$_pkgname/build"
    make install
}
