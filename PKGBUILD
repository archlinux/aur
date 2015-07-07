# Maintainer: William J Bowman <wjb@williamjbowman.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: dimino jeremie <jeremie@dimino.org>

pkgname=proofgeneral
pkgver=4.2
pkgrel=1
pkgdesc='Generic interface for proof assistants.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://proofgeneral.inf.ed.ac.uk/'
depends=('emacs>=24.3')
install="${pkgname}.install"
source=("http://proofgeneral.inf.ed.ac.uk/releases/ProofGeneral-${pkgver}.tgz"
  "Makefile.patch")
    
md5sums=('c9f7eac10ed7a04c96b90abcbf964427'
         'e8a2c065a928f641564174c1342cfa60')

build() {
  cd ProofGeneral

  make clean
  chmod +x isar/isartags

  patch -p2 < "${srcdir}/Makefile.patch"

  sed -i 's,phox/\*,,' Makefile
  sed -i 's,phox,,' Makefile

  make
}

package() {
  cd ProofGeneral

  make PREFIX=${pkgdir}/usr install -j1
}
