# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=rp++
_pkgname=rp
pkgver=1
_gitcommit=ba129d7f22fcc7fe17557dfb29670527af426d89
pkgrel=3
pkgdesc='Find ROP gadgets in PE/ELF/MACH-O x86/x64 binaries'
url='https://github.com/0vercl0k/rp'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/0vercl0k/rp/archive/${_gitcommit}.tar.gz)
sha512sums=('b95c8a9007c49707896dd3d996803608585bc1bf141fb8815fd648abecb42f8af4bda8c1d7f8ca5d99eadf213a4d4bd8df803839b5a3ba13cc257b6531ecad5e')

prepare() {
  cd ${_pkgname}-${_gitcommit}
  mkdir build
  sed 's/-static//g' -i CMakeLists.txt
}

build() {
  cd ${_pkgname}-${_gitcommit}/build
  cmake ..
  make
}

check() {
  cd ${_pkgname}-${_gitcommit}/bin
  ./rp* -f bin_tests/elf-x86-bash-v4.1.5.1 --search-hexa="main"
}

package() {
  cd ${_pkgname}-${_gitcommit}
  install -Dm 755 bin/rp-lin-* "${pkgdir}/usr/bin/rp"
}

# vim: ts=2 sw=2 et:
