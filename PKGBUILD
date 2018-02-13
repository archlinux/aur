# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Original Author: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium-git
pkgver=3.1.0.436.g7dbbf52eb
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('GPL3')
provides=('uranium')
conflicts=('uranium')
depends=('python' 'qt5-quickcontrols' 'pyqt5-common' 'python-pyqt5' 'python-numpy' 'python-scipy' 'libarcus-git')
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
