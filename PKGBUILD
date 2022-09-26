# Contributor: William J. Bowman <aur@williamjbowman.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>
# Contributor: dimino jeremie <jeremie@dimino.org>

pkgname=proofgeneral
pkgver=4.5
pkgrel=4
pkgdesc='Generic interface for proof assistants.'
arch=('any')
license=('GPL')
url='https://proofgeneral.github.io/'
depends=('emacs>=25.2')
install="${pkgname}.install"
source=("https://github.com/ProofGeneral/PG/archive/refs/tags/v${pkgver}.tar.gz")
replaces=('proofgeneral-nox')

sha512sums=('ab2eed43053e3b6749e840a8d742058eaa91bfff7edbe12ea67bc492ffab07e1d77cf6a7772cb8c42ac73cae2cce65b48898b1cd10a77b906089768f8055b366')

build() {
  cd "$srcdir/PG-${pkgver}"

  make
}

package() {
  cd "$srcdir/PG-${pkgver}"

  for file in $(find . -type f -name '*.el')
  do
      install -Dm644 "${file}" "${pkgdir}/usr/share/emacs/site-lisp/${_pkgname}/${file}"
  done
}
