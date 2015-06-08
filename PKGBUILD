# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=qhexedit
pkgbase=qhexedit-git
pkgname=('qhexedit-git' 'qhexedit-git-designer')
pkgver=r4.ad32056
pkgrel=1
pkgdesc="A hex editor widget written in C++ for the Qt 5.x"
arch=(i686 x86_64)
url="https://github.com/arthurzam/${pkgname}"
license=('GPL2')
depends=('qt5-base')
makedepends=('doxygen')
source=("${_pkgname}::git+git://github.com/arthurzam/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}
 
build() {
  msg "building qhexedit"
  cd "${srcdir}/${_pkgname}/sip"
  qmake-qt5 PREFIX=/usr qhexedit.pro
  make -j$(nproc)

  msg "building qhexedit designer plugin"
  cd "${srcdir}/${_pkgname}/sip/designer"
  qmake-qt5 PREFIX=/usr qhexedit.pro
  make -j$(nproc)
}
 
package_qhexedit-git() {
  provides=('qhexedit')

  cd "${srcdir}/${_pkgname}/sip"
  make INSTALL_ROOT="$pkgdir" install
}
 
package_qhexedit-git-designer() {
  depends=('qhexedit')

  cd "${srcdir}/${_pkgname}/sip/designer"
  make INSTALL_ROOT="$pkgdir" install
}