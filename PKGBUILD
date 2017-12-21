# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

pkgname=lib32-intel-tbb
pkgver=2018_20170919
_pkgver=2018_U1
pkgrel=1
pkgdesc="High level abstract threading library (32-bit)"
arch=('x86_64')
url="http://threadingbuildingblocks.org"
license=('GPL')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("https://github.com/01org/tbb/archive/${_pkgver}.tar.gz")
sha256sums=('c6462217d4ecef2b44fce63cfdf31f9db4f6ff493869899d497a5aef68b05fc5')

build() {
  cd "tbb-${_pkgver}"
  export CXXFLAGS+=" -fno-lifetime-dse" # FS#49898
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'
  make arch=ia32
}

package() {
  cd "tbb-${_pkgver}"
  install -d "${pkgdir}/usr/lib32"
  install -m755 build/linux_*/*.so* "${pkgdir}/usr/lib32"
}
