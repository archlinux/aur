# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-log4cpp
_pkgname=orocos-toolchain
pkgver=2.6.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (log4cpp)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
makedepends=('cmake')
source=(http://people.mech.kuleuven.be/~orocos/pub/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('ac68f90da0d7c4595e5d78687d68ab2f')
sha256sums=('d98adaf4975ffef6b79b7d31f16c488014e347afbc5549910f209db4a9f469fd')
sha384sums=('6fc673dd6a5f034b21f87b2171f6303077a5759cdcc7c9dd745e44b1a51a7a5a4028455c6588b24556d2d3907dd5b372')
sha512sums=('7d30ac8bb751c489302cb15c8a613345aabb2023c935c04f371bb35b52faabd9563e20da384fbe409a7f4533c133eea983484800680d22737be95b37653a6be9')

build() {
  # build log4cpp
  cd "${srcdir}/${_pkgname}-${pkgver}/log4cpp"

  sed 's#DESTINATION include#DESTINATION include/orocos#g' -i CMakeLists.txt
  sed 's#${CMAKE_BINARY_DIR}/log4cpp.pc#${CMAKE_BINARY_DIR}/orocos-log4cpp.pc#g' -i CMakeLists.txt
  sed 's#LOG4CPP_LIBRARY_NAME "log4cpp"#LOG4CPP_LIBRARY_NAME "orocos-log4cpp"#g' -i CMakeLists.txt
  sed 's#SET(includedir "\\${prefix}/include")#SET(includedir "\\${prefix}/include/orocos")#g' -i CMakeLists.txt
  sed 's#-llog4cpp#-lorocos-log4cpp#g' -i log4cpp.pc.in

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  # install log4cpp
  cd "${srcdir}/${_pkgname}-${pkgver}/log4cpp"
  make DESTDIR=${pkgdir} install
}

