# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

pkgname=lib32-intel-tbb
pkgver=2020.2
pkgrel=1
pkgdesc="High level abstract threading library (32-bit)"
arch=('x86_64')
url="https://threadingbuildingblocks.org"
license=('GPL')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("${pkgname#lib32-}-${pkgver}.tar.gz::https://github.com/intel/tbb/archive/v$pkgver.tar.gz")
sha256sums=('4804320e1e6cbe3a5421997b52199e3c1a3829b2ecb6489641da4b8e32faf500')

build() {
  cd "oneTBB-${pkgver}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'
  make arch=ia32
}

package() {
  cd "oneTBB-${pkgver}"
  install -d "${pkgdir}/usr/lib32"
  install -m755 build/linux_*/*.so* "${pkgdir}/usr/lib32"
}
