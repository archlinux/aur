# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=virtualplanetbuilder-git
pkgver=1.1.0.r1055.b0a456c
pkgrel=1
pkgdesc='Tool for generateing paged databases from geospatial imagery and heightfields'
arch=('i686' 'x86_64')
url='http://www.openscenegraph.org'
license=('LGPL')
depends=('gdal' 'openscenegraph>=3.0.0')
makedepends=('git' 'cmake>=2.4.4')
conflicts=('virtualplanetbuilder')
provides=('virtualplanetbuilder')
source=('git://github.com/openscenegraph/VirtualPlanetBuilder.git')
sha512sums=('SKIP')

pkgver() {
  cd VirtualPlanetBuilder
  echo "$(cat CMakeLists.txt | grep -m3 -e VIRTUALPLANETBUILDER_MAJOR_VERSION -e VIRTUALPLANETBUILDER_MINOR_VERSION -e VIRTUALPLANETBUILDER_PATCH_VERSION | grep -o "[[:digit:]]*" | paste -sd'.').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../VirtualPlanetBuilder \
    -DLIB_POSTFIX= \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 VirtualPlanetBuilder/LICENSE.txt ${pkgdir}/usr/share/licenses/virtualplanetbuilder-git/LICENSE.txt
}
