# Maintainer: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

pkgname=lib32-intel-tbb
pkgver=2017_20161128
_tag=tbb${pkgver/\./}oss
_file=${_tag}_src.tgz
pkgrel=1
pkgdesc="High level abstract threading library (32-bit)"
arch=('x86_64')
url="http://threadingbuildingblocks.org"
license=('GPL')
depends=("${pkgname#lib32-}" 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("http://threadingbuildingblocks.org/sites/default/files/software_releases/source/${_file}")
sha1sums=('2c451a5bcf6fc31487b98b4b29651c369874277c')

build() {
  cd "${_tag}"
  export CXXFLAGS+=" -fno-lifetime-dse" # FS#49898
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'
  make arch=ia32
}

package() {
  cd "${_tag}"
  install -d "${pkgdir}/usr/lib32"
  install -m755 build/linux_*/*.so* "${pkgdir}/usr/lib32"
}
