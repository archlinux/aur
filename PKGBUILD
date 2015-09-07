# Maintainer: Tommaso Falchi Delitala <volalto86@gmail.org>
pkgname=apm_planner
pkgver=2.0.18
pkgrel=1
pkgdesc="Ground Control Station for MAVlink based autopilots (e.g. Ardupilot)"
arch=('i686' 'x86_64')
url="http://planner2.ardupilot.com"
license=('GPL3')
source=("https://github.com/diydrones/apm_planner/archive/${pkgver}.tar.gz")
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'qt5-script' 'qt5-declarative' 'sdl2' 'flite-full' 'libsndfile' 'qt5-webkit')
md5sums=('ef3c076a82c5d1865e065de7fd290e28')

build() {
  # Uncomment to add support for Pixhawk mavlink dialect (require Google proto buffer) 
  # echo "MAVLINK_CONF += pixhawk" > "$srcdir/$pkgname-$pkgver/user_config.pri"  
  
  # Fix QDataStream include
  sed -i '39 a\#include <QDataStream>' "$srcdir/$pkgname-$pkgver/src/ui/AP2DataPlotThread.cc"
  
  qmake PREFIX=/usr "$srcdir/$pkgname-$pkgver/qgroundcontrol.pro"
  make
}

package() {
  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 "$srcdir/$pkgname-$pkgver/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et: 
