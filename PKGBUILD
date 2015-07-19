# Contributor: Luca Bennati <lucak3 AT gmail DOT com>
# Maintainer: Glaucous <glakke1 at gmail dot com>

pkgname=apitrace-git
pkgver=3598.cfa80d0
pkgrel=1
pkgdesc="Graphics API Tracing"
arch=('x86_64' 'i686')
url="https://github.com/apitrace/apitrace"
license=('BSD')
makedepends=('cmake>=2.8' 'git' 'mesa' 'qt5-webkit')
depends=('python2' 'libgl' 'procps-ng')
optdepends=('qt5-webkit: GUI support')
provides=('apitrace')
conflicts=('apitrace')
source=('apitrace::git+http://github.com/apitrace/apitrace.git#branch=master')
md5sums=(SKIP)

pkgver() {
  cd ${srcdir}/apitrace

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd ${srcdir}/apitrace

  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2.7 \
    -DENABLE_GUI=TRUE
  make -C build
}

package() {
  cd ${srcdir}/apitrace
  make -C build DESTDIR="${pkgdir}/" install

  mkdir -p "${pkgdir}"/usr/share/licenses/apitrace-git
  cd "${pkgdir}"/usr/share/licenses/apitrace-git
  ln -s ../../doc/apitrace/LICENSE.txt LICENSE
}

# vim:set ts=2 sw=2 et:
