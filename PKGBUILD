# Maintainer: Mattia Basaglia glax@dragon.best
_corpname=knotter
_pkgname='knotter'
pkgname="$_pkgname"
pkgver=0.9.6_46_gef7229f
pkgrel=1
pkgdesc="Editor for Celtic knots and similar designs"
url="https://knotter.mattbas.org/"
license=('GPL3')
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
makedepends=('git' 'cmake' 'qt5-tools')
depends=('qt5-base' 'qt5-svg' 'qt5-script' 'hicolor-icon-theme')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
        "$_pkgname::git+https://gitlab.com/mattbas/$_pkgname/#branch=master"
)
sha256sums=('SKIP')

prepare() {
        cd "$_pkgname/"

        git submodule update --init --recursive
}

pkgver() {
        cd "$srcdir/$_pkgname/"
        git describe --tags | tr - _
}

build() {
        cd "$srcdir/$_pkgname/"
        mkdir build
        cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=/usr
        make -j 4
}

package() {
        cd "$srcdir/$_pkgname/build"
        make install DESTDIR=$pkgdir >/dev/null
}

