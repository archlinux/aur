# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_pkgorg=openscenegraph
_pkgname=osgQt
_pkgver=3.5.7

pkgver=3.5.7.r1235.6d324db
pkgname=osgqt-qt4
pkgrel=1
pkgdesc="Qt project for making use of OpenSceneGraph"
arch=('i686' 'x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('LGPL3')
depends=($_pkgorg 'qt5-base')
optdepends=()
conflicts=("osgqt")
provides=("osgqt")
makedepends=('cmake')
source=("$_pkgname"::"git://github.com/$_pkgorg/$_pkgname.git")
md5sums=('SKIP')

prepare() {
    cd "$_pkgname"
    git checkout Qt4
}

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DLIB_POSTFIX= \
        -DOpenGL_GL_PREFERENCE=GLVND .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
