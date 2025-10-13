# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>
# Maintainer: FuzzyCheese

pkgname=rsp_tcp-git
pkgver=v0.1.beta.r16.g61b8c91
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

prepare() {
  cd "${srcdir}/RSPTCPServer"
  mkdir -p build
  cd build
  cmake -DCMAKE_POLICY_VERSION_MINIMUM='3.5' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..
}

build() {
  cd "${srcdir}/RSPTCPServer/build"
  make -j$(nproc)
}

package() {
  cd "${srcdir}/RSPTCPServer/build/"
  make DESTDIR="${pkgdir}" install
}
