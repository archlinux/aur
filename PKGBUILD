# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Original Author: Grey Christoforo <first name [at] last name [dot] net>

pkgname=uranium-git
pkgver=2.1.0.836.gb71a07a
pkgrel=1
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/Ultimaker/Uranium"
arch=('any')
license=('GPL3')
provides=('uranium')
conflicts=('uranium')
depends=('python' 'qt5-quickcontrols' 'pyqt5-common' 'python-pyqt5' 'python-numpy' 'libarcus-git')
makedepends=('cmake' 'git')
source=('git+https://github.com/Ultimaker/Uranium.git' 'site-packages-dir.patch')
md5sums=('SKIP' '104a4190a8df6b305801fefd0fb55387')

pkgver() {
  cd Uranium
  git describe --tags | sed 's/-/./g'
}

prepare(){
  cd Uranium
  patch -Np1 -i ../site-packages-dir.patch
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
