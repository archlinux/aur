# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=srdfdom
_pkgver=0.50.0
pkgname=${_pkgname}-git
pkgver=0.50.0.r69.ad29a7c
pkgrel=1
pkgdesc="Parser for Semantic Robot Description Format (SRDF)."
arch=('i686' 'x86_64')
url="https://github.com/nim65s/$_pkgname"
license=('GPL3')
depends=('boost' 'tinyxml' 'urdfdom-headers' 'console-bridge')
makedepends=('cmake' 'git')
optdepends=('doxygen')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname"::"git://github.com/nim65s/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule update --init
}

build() {
    cd "$_pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
