# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=soapyptezuka
_repo=SoapyPlutoPAPR
pkgver=0.2.2
_gitver=ec1c92dbef83631657fd58f49f2d0e363d4394c0
pkgrel=1
pkgdesc='Soapy SDR plugin for Tezuka FW'
arch=('x86_64')
url="https://github.com/F5OEO/${_repo}"
license=('LGPL-2.1-only')
depends=(
  'gcc-libs'
  'glibc'
  'libad9361'
  'libiio.so'
  'libusb'
  'soapysdr'
)
makedepends=(
  'cmake'
  'git'
)
source=("${pkgname}::git+${url}.git#commit=${_gitver}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" cmake --install build
}

