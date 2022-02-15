# Maintainer: Achmad Fathoni <fathoniDOTidATgmailDOTcom>
_pkgname=RTKLIB
pkgname=rtklib-qt-git
provides=("rtklib-qt")
pkgver=r128.27e5448
pkgrel=1
pkgdesc="An Open Source Program Package for GNSS Positioning"
arch=('x86_64')
url="http://www.rtklib.com/"
license=('GPL')
groups=('GNSS')
depends=('glibc')
makedepends=('git' 'gcc-fortran' 'qt5-base')
source=("${_pkgname}::git+https://github.com/JensReimann/RTKLIB-qt.git#branch=rtklib_2.4.3_qt")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "${_pkgname}"
    find . -name "*_qt.pro*" -exec sed -i '$ a target.path = /usr/bin\nINSTALLS += target' {} \;
}

build() {
    cd "${_pkgname}"
    qmake -recursive
    make
}

package() {
    make -C ${_pkgname} INSTALL_ROOT="$pkgdir" install
}
