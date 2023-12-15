# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=gl2ps
pkgname=$_pkgname-git
pkgver=1.4.0.r51.g0fea874
pkgrel=1
pkgdesc='OpenGL to PostScript printing library'
arch=('i686' 'x86_64')
url='https://www.geuz.org/gl2ps'
license=('LGPL')
depends=('libglvnd' 'libpng')
makedepends=('git' 'cmake' 'freeglut' 'glu' 'texlive-latexrecommended')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('gl2ps-svn')
source=("git+https://gitlab.onelab.info/gl2ps/gl2ps.git")
sha256sums=("SKIP")

pkgver() {
    cd ${_pkgname}/
    git describe --always --long | sed 's|gl2ps_||;s|_|.|g;s|-|.r|;s|-|.|'
}

prepare() {
    rm -Rf build && mkdir build
}

build() {
    cd build
    cmake ../$_pkgname/ -DCMAKE_INSTALL_PREFIX=/usr -DOpenGL_GL_PREFERENCE=GLVND
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}"/ install
}
