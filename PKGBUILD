# Mantainer: sxe <sxxe@gmx.de>
 
pkgname=qupzilla-git
_pkgname=qupzilla
pkgver=v2.0.0.r14.g90c2ad6
pkgrel=1
pkgdesc="A new and very fast open source browser based on WebKit core, written in Qt Framework."
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL')
depends=( 'qt5-base' 'qt5-script' 'qt5-tools' 'qt5-webengine' 'qt5-x11extras')
makedepends=('git')
provides=('qupzilla')
conflicts=('qupzilla' 'qupzilla-qt5-git')
source=("git://github.com/$_pkgname/$_pkgname.git")
md5sums=('SKIP')
 
pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"

    export USE_WEBGL="true"
    export KDE_INTEGRATION="true"
    export QUPZILLA_PREFIX="/usr/"

    qmake-qt5
    make clean
    make
}
 
package() {
    cd "$srcdir/$_pkgname"
    make INSTALL_ROOT="${pkgdir}" install
} 
