# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=cura-git
pkgver=4.5.0.r192.g44b61d370
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
         'python-sentry_sdk'
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
            'cura-fdm-materials-git: Default Materials'
            'python-trimesh: Reading AMF files'
            'python-libcharon: UFPWriter/UFPReader')
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
