# Maintainer: racko <tim dot rakowski at gmail dot com>
# Contributor: marauder <abhinav dot kssk at gmail dot com>
# Contributor: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Vladimir Ermakov <vooon341@gmail.com>

pkgname=gazebo
pkgver=9.3.1
pkgrel=1
pkgdesc="A multi-robot simulator for outdoor environments"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
# See: http://www.gazebosim.org/tutorials?tut=install_from_source&cat=install
depends=('boost>=1.40.0' 'curl>=4.0' 'freeglut' 'freeimage>=3.0'
         'intel-tbb>=3.0' 'libccd>=1.4' 'libltdl>=2.4.2' 'libtar>=1.2' 'libxml2>=2.7.7'
         'ogre' 'protobuf>=2.3.0' 'sdformat>=6.0.0' 'ignition-math>=4' 'ignition-transport>=4'
         'ignition-common' 'ignition-fuel_tools' 'ignition-msgs' 'tinyxml2' 'qwt')
optdepends=('bullet: Bullet support'
            'cegui: Design custom graphical interfaces'
            'ffmpeg: Playback movies on textured surfaces'
            'gdal: Digital elevation terrains support'
            'libdart: DART support'
            'libspnav: space navigator joystick support'
            'libusb: USB peripherals support'
            'ruby-ronn: Generate manpages'
            'simbody: Simbody support'
            'urdfdom: Load URDF files')
makedepends=('cmake' 'doxygen')
install="${pkgname}.install"
source=("https://bitbucket.org/osrf/gazebo/get/gazebo9_9.3.1.tar.bz2")
# source=("https://bitbucket.org/osrf/gazebo/get/gazebo9_9.3.1.tar.bz2" "ogre-1.11.patch")
sha256sums=('33c970576d36a5db1b84f3e01e49dcb5976d4013d58f6308d32ca8e819fba975')
# '0544018a614fe6a4caf7554cb6c751fc1e1c82e8035a0c3ddb0178786955ce9a')

#  prepare() {
#    cd "${srcdir}/osrf-${pkgname}-5714795a2e79"
#    patch -Np2 -i "${srcdir}/ogre-1.11.patch"
#  }

build() {
  cd "${srcdir}/osrf-${pkgname}-5714795a2e79"

  # sed -i -e 's/CODEC_CAP_TRUNCATED/AV_CODEC_CAP_TRUNCATED/g' gazebo/common/AudioDecoder.cc
  # sed -i -e 's/CODEC_FLAG_TRUNCATED/AV_CODEC_FLAG_TRUNCATED/g' gazebo/common/AudioDecoder.cc
  
  # sed -i -e 's/CODEC_CAP_TRUNCATED/AV_CODEC_CAP_TRUNCATED/g' gazebo/common/Video.cc
  # sed -i -e 's/CODEC_FLAG_TRUNCATED/AV_CODEC_FLAG_TRUNCATED/g' gazebo/common/Video.cc
  mkdir -p build && cd build

  # Note: we skip unit tests (else set to TRUE)
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"
  make
}

package() {
  cd "${srcdir}/osrf-${pkgname}-5714795a2e79/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
