# Mantainer: sxe <sxxe@gmx.de>
 
pkgname=qupzilla-git
_pkgname=qupzilla
pkgver=v1.8.0.r315.g94d89e4
pkgrel=2
pkgdesc="A new and very fast open source browser based on WebKit core, written in Qt Framework."
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL')
depends=( 'qt5-base' 'qt5-script' 'qt5-tools' 'qt5-webengine' 'qt5-x11extras')
makedepends=('git')
provides=('qupzilla')
conflicts=('qupzilla' 'qupzilla-qt5-git')
source=("git://github.com/$_pkgname/$_pkgname.git#branch=qt5.5")
md5sums=('SKIP')
 
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count qt5.5)" "$(git rev-parse --short qt5.5)"
  )
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