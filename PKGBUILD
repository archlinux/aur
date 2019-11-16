# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=latex-tuda-ci
pkgver=2.02
pkgrel=1
pkgdesc='TUDa-CI for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://github.com/tudace/tuda_latex_templates'
license=('custom')
depends=('latex-tuda-ci-logos')
makedepends=('texlive-core' 'texlive-bin' 'texlive-publishers' 'texlive-latexextra' 'texlive-fontsextra'
              'texlive-bibtexextra' 'texlive-pictures' 'biber' 'zip')
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/tuda_latex_templates/archive/v${pkgver}.tar.gz")
sha512sums=('7fb1721f81a6e7d8ed661b2b0bedea53faed29a3974aa4aa97bed5c223f2399e342eac914a586b8524507b34fd07ad053e2cbace9c86a513722ee6fca7b7c4d2')

prepare() {
  chmod +x tuda_latex_templates-${pkgver}/{addlicense,prepare_tuda}.sh
}

build() {
  cd tuda_latex_templates-${pkgver}
  export TEXINPUTS=".:${srcdir}/tuda_latex_templates-${pkgver}/tex:${TEXINPUTS}"
  ./addlicense.sh
  ./prepare_tuda.sh
}

package() {
  cd tuda_latex_templates-${pkgver}
  install -Dm644 LICENSE_info "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -dm755 "${pkgdir}"/usr/share/
  cp -r texmf "${pkgdir}"/usr/share/
}
