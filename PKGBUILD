# Maintainer: drakkan <nicola.murino@gmail.com>
# Contributor: drakkan <nicola.murino@gmail.com>

pkgname=kdsoap-qt4
_basename="KDSoap"
pkgver=1.4.0
pkgrel=3
pkgdesc='Qt-based client-side and server-side SOAP component'
license=('GPL3' 'LGPL' 'custom')
arch=('x86_64' 'i686')
url='https://github.com/KDAB/KDSoap'
depends=('qt4')
conflicts=('kdsoap')
makedepends=('python2' 'git')
source=("git+https://github.com/KDAB/KDSoap.git")
md5sums=('SKIP')

prepare() {
  cd "$_basename"
  git checkout kdsoap-1.4
  git submodule update --init
  python2 autogen.py -release -shared -prefix /usr -qmake /usr/bin/qmake-qt4
  sed -i 's/include($$KDSOAPDIR\/kdwsdl2cpp.pri)/include($$KDSOAPDIR\/share\/doc\/KDSoap\/kdwsdl2cpp.pri)/g' kdsoap.pri
}

build() {
  cd "$_basename"
  ./configure.sh -release -shared -prefix /usr -qmake /usr/bin/qmake-qt4
  make 
}

package() {
  cd "$_basename"
  make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
