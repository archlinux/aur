# Maintainer: marauder <abhinav dot kssk at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=8.0.0
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libccd>=1.4' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre' 'protobuf>=2.3.0' 'qt4' 'qtwebkit' 'sdformat>=5.0.0' 'ignition-math>=3' 'ignition-transport>=3'
         'tinyxml>=2.6.2' 'tinyxml2' 'qwt')
optdepends=('bullet>=2.82: Bullet support'
            'cegui>=0.8.3: Design custom graphical interfaces'
            'ffmpeg: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart>=3.0: DART support'
            'libspnav: space navigator joystick support'
            'libusb: USB peripherals support'
            'ruby-ronn: Generate manpages'
            'simbody>=3.3: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'doxygen' 'pkg-config>=0.26')
install="${pkgname}.install"
source=("http://osrf-distributions.s3.amazonaws.com/gazebo/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ea733be6946ac5c538bf207ba01f3a6d6afa456d0b70455f7066b19d722f0d12')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p build && cd build

  # Note: we skip unit tests (else set to TRUE)
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
