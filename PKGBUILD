# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Troy Patrick <patrictroy at gmail dot com>
# Contributor: racko <tim dot rakowski at gmail dot com>
# Contributor: marauder <abhinav dot kssk at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>
# Contributor: Bernd Müller <github@muellerbernd.de>

pkgname=gazebo
pkgver=11.13.0
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="https://classic.gazebosim.org/"
license=('Apache')
depends=('boost' 'curl' 'freeglut' 'freeimage' 'tbb' 'libccd' 'libltdl' 'graphviz'
         'libtar' 'libxml2' 'ogre-1.9' 'protobuf' 'sdformat-9' 'ignition-math-6' 'ignition-transport-8'
         'ignition-cmake-2' 'ignition-common-3' 'ignition-fuel_tools-4' 'ignition-msgs-5' 'tinyxml2' 'qwt')
optdepends=('bullet: Bullet support'
            'cegui: Design custom graphical interfaces'
            'ffmpeg4.4: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart: DART support'
            'libspnav: space navigator joystick support'
            'libusb: USB peripherals support'
            'simbody: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'doxygen' 'ruby-ronn')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gazebosim/gazebo-classic/archive/${pkgname}11_$pkgver.tar.gz")
sha256sums=('a990f27dd08e4461107ef8e29eef18470789e7cd87cdb26e7f384769603537fd')

_pkgname=gazebo-classic

build() {
  cd "${srcdir}/${_pkgname}-${pkgname}11_$pkgver"

  mkdir -p build && cd build

  export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgname}11_$pkgver/build"
  DESTDIR="${pkgdir}" make install
}
