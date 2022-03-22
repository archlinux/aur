# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=latex-tuda-ci
_pkgname=tuda_latex_templates
pkgver=3.23
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
b2sums=('5fa50ae75583b2c1871e1d1229abc97f9e42ca93eb5d84b1bc8e4929e6d4c4627d364dcefb07bd80992557e349a07cd7f303fb6f3f1bd3ea27f15c774f497f6e')

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
