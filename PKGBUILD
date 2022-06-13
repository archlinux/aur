# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=velvet
pkgver=1.2.10
pkgrel=4
pkgdesc="Sequence assembler for very short reads"
arch=("i686" "x86_64")
url="https://github.com/dzerbino/velvet"
license=("GPL3")
depends=("zlib")
options=(!makeflags) # Build system for this software assumes non-parallel make
source=("https://github.com/dzerbino/velvet/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4615e52dc2e8a05f1009daf2c0978c218860be364afa044f73677cd298f10c7b')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}"/usr/share/doc/velvet
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/man/man1
  install -t "${pkgdir}"/usr/share/doc/velvet -m644 Manual.pdf README.txt CREDITS.txt
  install -t "${pkgdir}"/usr/bin -m755 velvetg velveth 

  mkdir -p "${pkgdir}"/usr/share/velvet
  cp -r contrib "${pkgdir}"/usr/share/velvet
}

