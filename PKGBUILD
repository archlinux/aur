# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=rp++
_pkgname=rp
pkgver=1
pkgrel=2
pkgdesc="Find ROP gadgets in PE/ELF/MACH-O x86/x64 binaries"
url="https://github.com/0vercl0k/rp"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/0vercl0k/rp/archive/v${pkgver}.tar.gz)
sha256sums=('3bf69aee23421ffdc5c7fc3ce6c30eb7510640d384ce58f4a820bae02effebe3')

build() {
  cd ${_pkgname}-${pkgver}
  mkdir build
  cd build
  cmake ..
  make
}

check() {
  cd ${_pkgname}-${pkgver}/bin
  ./rp* -f bin_tests/elf-x86-bash-v4.1.5.1 --search-hexa="main"
}

package() {
  cd ${_pkgname}-${pkgver}
  install -d "${pkgdir}/usr/bin"
  install -m755 bin/rp* "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
