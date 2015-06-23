# Mantainer: sxe <sxxe@gmx.de>
 
pkgname=dfilemanager-git
_pkgname=dfilemanager
pkgver=r384.806a28a
pkgrel=2
pkgdesc="Dfilemanager, a QT based crossplatform File browser."
arch=('i686' 'x86_64')
url="http://dfilemanager.sourceforge.net/"
license=('GPL')
depends=( 'qt5-base' 'qt5-script' 'qt5-tools')
optdepends=('solid')
makedepends=('git' 'cmake')
provides=('dfilemanager')
conflicts=('dfilemanager')
source=("${_pkgname}::git://git.code.sf.net/p/dfilemanager/code")
md5sums=('SKIP')
 
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/$_pkgname/dfm"

    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DQT5BUILD=ON
    make
}
 
package() {
    cd "$srcdir/$_pkgname/dfm"
    #make INSTALL_ROOT="${pkgdir}" install
    make DESTDIR="$pkgdir/" install
} 