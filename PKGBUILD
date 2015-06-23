# Mantainer: sxe <sxxe@gmx.de>
 
pkgname=qupzilla-git
_pkgname=qupzilla
pkgver=v1.8.0.r142.g8d7cfb0
pkgrel=1
pkgdesc="A new and very fast open source browser based on WebKit core, written in Qt Framework."
arch=('i686' 'x86_64')
url="http://www.qupzilla.com"
license=('GPL')
depends=( 'qt5-base' 'qt5-script' 'qt5-tools' 'qt5-webengine')
makedepends=('git')
provides=('qupzilla')
conflicts=('qupzilla' 'qupzilla-qt5-git')
source=("git://github.com/$_pkgname/$_pkgname.git#branch=master")
md5sums=('SKIP')
 
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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