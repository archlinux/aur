# Previous Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Maintainer: Gonçalo Camelo Neves Pereira <goncalo_pereira@outlook.pt>
pkgname=esp-idf
pkgver=3.0_rc1
_pkgver=3.0-rc1
pkgrel=1
pkgdesc="Espressif IoT Development Framework. Official development framework for ESP32."
arch=('i686' 'x86_64' 'aarch' 'aarch64' 'armv7h')
url="https://github.com/espressif/esp-idf"
license=('APACHE')
depends=('gcc' 'git' 'make' 'ncurses' 'flex' 'bison' 'gperf' 'python2-pyserial')
source=(https://github.com/espressif/${pkgname}/archive/v${_pkgver}.tar.gz)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  msg "Starting CMake (build type = ${_buildtype})"

  # Create a build directory
  mkdir -p "${srcdir}/${pkgname}-${_pkgver}-build"
  cd "${srcdir}/${pkgname}-${pkgver}-build"

  # Run CMake in release
  cmake "${srcdir}/${pkgname}-${_pkgver}"

  make
}

# Create the package
package() {
  # Install in /opt/roboptim
  cd "${srcdir}/${pkgname}-${_pkgver}-build"

  make install
}