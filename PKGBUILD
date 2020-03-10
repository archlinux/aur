# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
pkgver=2.09
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
sha512sums=('853b549b39442033945ff241b0b275c9133996d84a4477c5973c3536d9ccb7cb70e21e50803c9eed880c2f23157cfa416c29f46806bec2f53e46302aafc9b241')

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
