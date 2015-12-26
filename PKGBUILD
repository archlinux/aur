# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=6.1.0
pkgrel=5
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libccd>=1.4' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre' 'protobuf>=2.3.0' 'qt4' 'sdformat>=3.1.1' 'ignition-math>=2'
         'tinyxml>=2.6.2')
optdepends=('bullet>=2.82: Bullet support'
            'cegui>=0.8.3: Design custom graphical interfaces'
            'ffmpeg>=0.8.3: Playback movies on textured surfaces'
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
sha256sums=('0460f1c706f609b6ff0e61a71bdd3cac2d55d714147edc01609b5226e7fb2904')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create build directory
  mkdir -p build && cd build

  # Run CMake
  # Note: we skip unit tests (else set to TRUE)
  msg "Preparing Makefiles..."
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DENABLE_TESTS_COMPILATION:BOOL=False

  # Compile Gazebo
  msg "Compiling..."
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  # Install Gazebo
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
