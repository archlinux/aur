# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Original Author: Grey Christoforo <first name [at] last name [dot] net>

pkgname=bcn3duranium-git
pkgver=3.0.3.503.gc0186e3e6
pkgrel=2
pkgdesc="A Python framework for building Desktop applications."
url="https://github.com/BCN3D/Uranium"
arch=('any')
license=('GPL3')
provides=('uranium' 'uranium-git' 'bcn3duranium')
conflicts=('uranium')
depends=('python2-pyqt5' 'qt5-quickcontrols'
         'python' 'python-pyqt5' 'python-numpy' 'python-shapely' 'python-scipy'
         'libarcus-git')
makedepends=('cmake' 'git')
source=('git+https://github.com/BCN3D/Uranium.git'
        'bcn3duranium.patch')
md5sums=('SKIP'
         '3485d507b4053cd8f1574e908263f9d1')

prepare() {
    cd $srcdir
    patch --forward --strip=1 --input="${srcdir}/bcn3duranium.patch"
}

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
