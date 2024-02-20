# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=3.36
pkgrel=1
pkgdesc='TUDa-CI for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://github.com/tudace/tuda_latex_templates'
license=('custom')
depends=('latex-tuda-ci-logos')
makedepends=(
  'biber'
  'texlive-basic'
  'texlive-bibtexextra'
  'texlive-bin'
  'texlive-fontsextra'
  'texlive-langcyrillic'
  'texlive-langgerman'
  'texlive-latexextra'
  'texlive-luatex'
  'texlive-pictures'
  'texlive-publishers'
  'zip'
)
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/${_pkgname}/archive/v${pkgver}/${pkgver}-${_pkgname}.tar.gz")
b2sums=('1a8adb9291a2123c4bbd7c8aec0b88befbed4300633a8ae025ba0a94ad741e5146255e31b8e527f10fe4b98f2ba45c8c9b7c7b1fbc3528af81b8b8d69300655a')

prepare() {
  chmod +x ${_pkgname}-${pkgver}/prepare_tuda.sh
}

build() {
  cd ${_pkgname}-${pkgver}
  export TEXINPUTS=".:${srcdir}/${_pkgname}-${pkgver}/tex:${TEXINPUTS}"
  ./prepare_tuda.sh
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm644 LICENSE_info "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -dm755 "${pkgdir}"/usr/share/
  cp -r texmf "${pkgdir}"/usr/share/
}
