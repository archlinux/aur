# Maintainer: William J Bowman <aur@williamjbowman.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: dimino jeremie <jeremie@dimino.org>

pkgname=proofgeneral
pkgver=4.4
pkgrel=3
pkgdesc='Generic interface for proof assistants.'
arch=('any')
license=('GPL')
url='https://proofgeneral.github.io/'
depends=('emacs') # >=24.3, but the version constraint causes issues with emacs-nox
install="${pkgname}.install"
source=("https://github.com/ProofGeneral/PG/archive/v${pkgver}.tar.gz")
replaces=('proofgeneral-nox')

md5sums=('4a80e31f88cb22d7caa6f28ba83dcc06')
sha256sums=('1ba236d81768a87afa0287f49d4b2223097bc61d180468cbd997d46ab6132e7e')
sha512sums=('8be7f78b61a225fa4770698bbbb251424a0afe093efc3229f74f3a764317dc8cc00a72cb29e751f755dc5fdab59983906c9185f7828a1644a87d160265f12061')

build() {
  cd "$srcdir/PG-${pkgver}"

  make clean
  chmod +x isar/isartags

  make
}

package() {
  cd "$srcdir/PG-${pkgver}"

  make PREFIX=${pkgdir}/usr install -j1
}
