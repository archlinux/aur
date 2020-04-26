# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
pkgver=2.10
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
b2sums=('543f5213fce9ab12127f7f5baffcd8892ec8fd46e3da9a96d1c30513f743082a4fe7935dd835887364a6607436c1fec4355efa09ae1f9b01683917d35f4ba1d0')

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
