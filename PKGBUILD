# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=velvet
pkgver=1.2.10
pkgrel=2
pkgdesc="Sequence assembler for very short reads"
arch=("i686" "x86_64")
url="http://www.ebi.ac.uk/~zerbino/velvet/"
license=("GPL3")
depends=("zlib")
options=(!makeflags) # Build system for this software assumes non-parallel make
source=("http://www.ebi.ac.uk/~zerbino/velvet/velvet_${pkgver}.tgz")

build() {
  cd "${pkgname}_${pkgver}"
  make
}

package() {
  cd "${pkgname}_${pkgver}"
  mkdir -p "${pkgdir}"/usr/share/doc/velvet
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/man/man1
  install -t "${pkgdir}"/usr/share/doc/velvet -m644 Manual.pdf README.txt CREDITS.txt
  install -t "${pkgdir}"/usr/bin -m755 velvetg velveth 

  mkdir -p "${pkgdir}"/usr/share/velvet
  cp -r contrib "${pkgdir}"/usr/share/velvet
}

sha1sums=('216f0941609abf3a73adbba19ef1f364df489d18')
