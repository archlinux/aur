# Maintainer: FuzzyCheese
pkgname=rsp_tcp-git
pkgver=v0.1.beta.r8.ga799c49
pkgrel=1
pkgdesc="a rtl_tcp compatible IQ server for the RSP range of SDRPlay SDR"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/SDRplay/RSPTCPServer"
license=('GPL3')
depends=('libusb>=1.0' 'libsdrplay')
makedepends=('git' 'cmake')
provides=('rsp_tcp')
source=('git+https://github.com/SDRplay/RSPTCPServer')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/RSPTCPServer"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/RSPTCPServer"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  cd "${srcdir}/RSPTCPServer/build/"
  make DESTDIR="${pkgdir}" install
}