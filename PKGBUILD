# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=1.9.1
pkgrel=3
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/user_guide/installation__requirements.html
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre-1.8' 'protobuf>=2.3.0' 'qt4' 'sdformat-hg'
         'tinyxml>=2.6.2')
optdepends=('bullet>=2.81: Bullet support'
            'cegui-0.7>=0.7.5: Design custom graphical interfaces'
            'ffmpeg>=0.8.3: Playback movies on textured surfaces'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'doxygen' 'pkg-config>=0.26')
install="${pkgname}.install"
source=(http://gazebosim.org/assets/distributions/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4f673d7f5daef456f871647d582ff493')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create build directory
  mkdir -p build && cd build

  # Run CMake. We skip unit tests.
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DENABLE_TESTS_COMPILATION:BOOL=False

  # Compile Gazebo
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
