# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=cura-git
pkgver=2.3.0.1354.g35cbedc5
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker."
arch=('any')
license=('GPL3')
url="https://github.com/Ultimaker/Cura"
provides=('cura')
conflicts=('cura')
depends=('python' 'python-pyqt5' 'python-numpy' 'python-protobuf' 'qt5-quickcontrols' 'libarcus-git' 'uranium-git' 'curaengine-git')
makedepends=('git' 'cmake')
optdepends=('python-zeroconf: Detecting mDNS printers'
         'cura-binary-data-git: Firmwares and translations'
         'python-pyserial: USB printing'
         'cura-fdm-materials-git: Default Materials')
source=('git+https://github.com/Ultimaker/Cura.git' 'site-packages-dir.patch')
md5sums=('SKIP' '68ddf58623d21a736d1075099667bdef')

pkgver() {
  cd Cura
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd Cura
  patch -Np1 -i ../site-packages-dir.patch
}

build() {
  mkdir -p Cura/build
  cd Cura/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DURANIUM_SCRIPTS_DIR=/usr/share/uranium/scripts ..
  make
}

package() {
  cd "$srcdir/Cura/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
