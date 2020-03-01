# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Original Author: Grey Christoforo <first name [at] last name [dot] net>

pkgname=curaengine-git
pkgver=r7396.3aa04cf8
pkgrel=1
epoch=1
pkgdesc="CuraEngine is a powerful, fast and robust engine for processing 3D models into 3D printing instruction for Ultimaker and other GCode based 3D printers. It is part of the larger open source project called Cura."
url="https://github.com/Ultimaker/CuraEngine"
arch=('i686' 'x86_64')
license=('GPL3')
provides=('curaengine')
conflicts=('curaengine')
depends=('libarcus-git')
makedepends=('cmake' 'git')
source=('git+https://github.com/Ultimaker/CuraEngine.git')
md5sums=('SKIP')

pkgver() {
  cd CuraEngine
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p CuraEngine/build
  cd CuraEngine/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd CuraEngine/build
  make DESTDIR="${pkgdir}" install
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
