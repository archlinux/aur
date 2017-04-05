# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=gepetto-viewer
_pkgver=1.3.0
pkgname=${_pkgname}-git
pkgver=1.3.0.r192.ae098e3
pkgrel=1
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/nim65s/$_pkgname"
license=('BSD')
depends=('boost-libs' 'urdfdom' 'openscenegraph-qt4')
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
    git checkout devel
}

build() {
    cd "$_pkgname"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
    install -D -m755 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
