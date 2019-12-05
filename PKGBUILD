# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=cura-git
pkgver=4.4.0.r201.g19da7b932
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker."
arch=('any')
license=('GPL3')
url="https://github.com/Ultimaker/Cura"
provides=('cura')
conflicts=('cura')
depends=('python'
         'python-pyqt5'
         'python-numpy'
         'python-protobuf'
         'python-requests'
         'python-certifi'
         'qt5-graphicaleffects'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'libarcus-git'
         'libsavitar'
         'uranium-git'
         'curaengine-git')
makedepends=('git' 'cmake')
optdepends=('python-zeroconf: Detecting mDNS printers'
            'cura-binary-data-git: Firmwares and translations'
            'python-pyserial: USB printing'
            'cura-fdm-materials-git: Default Materials')
source=('git+https://github.com/Ultimaker/Cura.git')
md5sums=('SKIP')

pkgver() {
  cd Cura
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
