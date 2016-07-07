# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=gl2ps
pkgname=$_pkgname-svn
pkgver=1.3.9.20160707
pkgrel=1
pkgdesc='OpenGL to PostScript printing library'
arch=('i686' 'x86_64')
url='http://www.geuz.org/gl2ps'
license=('LGPL')
depends=('libgl' 'libpng')
makedepends=('subversion' 'cmake' 'glut' 'glu' 'texlive-core')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("http://geuz.org/$_pkgname/src/$_pkgname-svn.tgz")
sha256sums=("SKIP")

pkgver() {
    ls $srcdir | grep source | sed 's:^gl2ps.::;s:-svn-:.:;s:-source$::'
}

build() {
    rm -Rf build && mkdir build && cd build
    cmake $srcdir/$_pkgname-*-source/ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR=$pkgdir install
}
