# Maintainer: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura
pkgver=15.06.03
pkgrel=2
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=('qt5-svg' 'python-pyserial' 'python-numpy' 'uranium' 'curaengine')
makedepends=('qt5-tools')
provides=('cura')
url="https://ultimaker.com/en/products/cura-software"
license=('AGPLv3')
arch=('i686' 'x86_64')
source=(https://github.com/Ultimaker/Cura/archive/${pkgver}.tar.gz site-packages-dir.patch)
sha1sums=('d03d3e86fd40de6e791301b696c8c53ae288faa7'
          'a1a21f761ababccf366ce100c536b21e83c69fb9')

install=cura.install

prepare(){
  cd Cura-${pkgver}
  patch -Np1 -i ../site-packages-dir.patch
}

build(){
  cd Cura-${pkgver}
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DURANIUM_SCRIPTS_DIR=/usr/share/uranium/scripts
  make
}

package(){
  cd Cura-${pkgver}
  make DESTDIR="${pkgdir}" install
  # rename executable
  mv ${pkgdir}/usr/bin/cura_app.py ${pkgdir}/usr/bin/cura
}


