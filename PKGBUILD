# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=3.21
pkgrel=1
pkgdesc='TUDa-CI for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://github.com/tudace/tuda_latex_templates'
license=('custom')
depends=('latex-tuda-ci-logos')
makedepends=('texlive-core' 'texlive-bin' 'texlive-publishers' 'texlive-latexextra' 'texlive-fontsextra'
              'texlive-bibtexextra' 'texlive-pictures' 'texlive-langcyrillic' 'biber' 'zip')
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/${_pkgname}/archive/v${pkgver}/${pkgver}-${_pkgname}.tar.gz")
b2sums=('96c5e0635c124185305e250e3cdc47dbec452a89836395229e9af6ec38653181c3c7725ab32c19c7a034048aa1c0753006f739c727d96e0243cac8002854dcf1')

prepare() {
  chmod +x ${_pkgname}-${pkgver}/{addlicense,prepare_tuda}.sh
}

build() {
  cd ${_pkgname}-${pkgver}
  export TEXINPUTS=".:${srcdir}/${_pkgname}-${pkgver}/tex:${TEXINPUTS}"
  ./addlicense.sh
  ./prepare_tuda.sh
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm644 LICENSE_info "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -dm755 "${pkgdir}"/usr/share/
  cp -r texmf "${pkgdir}"/usr/share/
}
