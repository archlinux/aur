# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=emf4cpp
pkgver=1012011253
pkgrel=1
pkgdesc="A C++ implementation and type mapping for the Eclipse Modeling Framework (EMF) core, the Ecore metamodel."
arch=('i686' 'x86_64')
url="https://code.google.com/p/emf4cpp/"
license=('LGPL')
depends=('boost' 'java-environment')
makedepends=('cmake')
source=(https://emf4cpp.googlecode.com/files/${pkgname}-source-${pkgver}.tgz)
md5sums=('d77eec7486243ddeeb2305744180cde2')
sha256sums=('be9add194bbb915ddbd721d2e6323e412a24cf8c5609a49bc60753d11992833d')
sha384sums=('e452d4d28aba50e501a8559a20cdaadded48ee3249aaabc48bc90e148459d3d3fae276f5121ac13aad8468728efaabbc')
sha512sums=('a1b79413c465a02ec0ad691ae7b12a53b985244cea8a4e83e6281029fd818e9486c384c49b0470d9f75c2e29886478a5d2ab95842df5247062b9b730fc7ffca5')

build() {
  cd "${srcdir}/${pkgname}-source-${pkgver}"

  # fix problem with ptrdiff_t
  sed "s/#include <stdexcept>/#include <stdexcept>\n#include <cstddef>/g" -i emf4cpp/ecorecpp/mapping/any.hpp

  if [ -d build ]; then
    rm -rf build
  fi

  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-source-${pkgver}"

  cd build
  make DESTDIR="${pkgdir}" install
}

