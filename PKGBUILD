# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Original Author: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium-git
pkgver=4.4.0.103.g78fa9ab2
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('GPL3')
provides=('uranium')
conflicts=('uranium')
depends=('qt5-quickcontrols'
         'python'
         'python-certifi'
         'python-cryptography'
         'python-numpy'
         'python-pyqt5'
         'python-scipy'
         'python-shapely'
         'libarcus-git')
makedepends=('cmake' 'git')
source=('git+https://github.com/Ultimaker/Uranium.git')
md5sums=('SKIP')

pkgver() {
  cd Uranium
  git describe --tags | sed 's/-/./g'
}

build() {
  mkdir -p Uranium/build
  cd Uranium/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd Uranium/build
  make DESTDIR="${pkgdir}" install

  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
