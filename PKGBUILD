# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Benjamin Chrétien <chretien at lirmm dot fr>
pkgname=git-latexdiff
pkgver=1.2.0
pkgrel=4
pkgdesc="Simple but very convenient wrapper around Git and latexdiff"
arch=('any')
url="https://gitlab.com/git-latexdiff/git-latexdiff"
license=('BSD')
makedepends=('asciidoc')
depends=('texlive-core' 'texlive-bin' 'git')
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8ec04cb8e2717ccf29053c29dd53c13ce79ef7f6eb4fecd5a5ff339f7f3aa856')

build() {
  cd "${srcdir}"/${pkgname}-v"${pkgver}"

  # we need to initialize an empty git repository so git-latexdiff can print
  # its help message (as a step for making the manpage).
  git init
  make git-latexdiff.1
}

package() {
  cd "${srcdir}"/${pkgname}-v"${pkgver}"

  install -m0755 -D git-latexdiff "${pkgdir}"/usr/bin/git-latexdiff
  install -m0644 -D git-latexdiff.1 "${pkgdir}"/usr/share/man/man1/git-latexdiff.1
  install -m0644 -D COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
