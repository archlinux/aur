# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=soapytezuka-git
pkgver=0.2.2.r0.2.2.r105
pkgrel=1
pkgdesc='Soapy SDR plugin for Tezuka FW'
arch=('x86_64')
url="https://github.com/F5OEO/SoapyPlutoPAPR"
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
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "0.2.2.r%s" "${_major}" "$(git rev-list --count HEAD)"
}

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

