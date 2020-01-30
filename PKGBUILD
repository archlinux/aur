# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=latex-tuda-ci
pkgver=2.07
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
sha512sums=('f18dae45e9b1bc9b0484a7fabe92c23f903e4193feffc25255d2fdc88dccca78c5e69a64ee3aeef35f18a6ac55bf2a9d3628e68d4381009c4de8e8119bea5051')

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
