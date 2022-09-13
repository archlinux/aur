# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=gepetto-viewer
_pkgver=4.11.0
pkgname=${_pkgname}-git
pkgver=4.11.0.r599.5582d7a
pkgrel=1
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/gepetto/$pkgname"
license=('BSD')
depends=('openscenegraph' 'urdfdom' 'osgqt' 'boost')
makedepends=('cmake' 'boost' 'urdfdom' 'git')
optdepends=('openscenegraph-dae: load DAE files')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname"::"git://github.com/gepetto/$_pkgname.git")
sha256sums=('SKIP')

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

check() {
    cd "$_pkgname"
    make test
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
