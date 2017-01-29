# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=cura-fdm-materials-git
pkgver=cura.2.3.0.7.g96f68f3
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker."
arch=('any')
license=('GPL3')
url="https://github.com/Ultimaker/fdm_materials"
provides=('cura-fdm-materials')
conflicts=('cura-fdm-materials')
depends=()
makedepends=('git' 'cmake')
source=('git+https://github.com/Ultimaker/fdm_materials')
md5sums=('SKIP')

pkgver() {
  cd fdm_materials
  git describe --tags | sed 's/-/./g'
}

build() {
  mkdir -p fdm_materials/build
  cd fdm_materials/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/fdm_materials/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
