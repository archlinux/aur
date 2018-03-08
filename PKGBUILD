# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>

pkgname=arara-git
_gitname=arara
pkgver=3.0.r252.g93ed057
pkgrel=1
pkgdesc='The cool TeX automation tool'
arch=('any')
url='https://github.com/cereda/arara'
license=('BSD')
depends=(java-environment-common maven)
makedepends=(git maven)
optdepends=('texlive-core: for compiling LaTeX documents')
source=("git+https://github.com/cereda/arara.git"
        arara_launch)
md5sums=('SKIP'
         'efcf9e31c1b0d90cae192afc91a0d980')
sha256sums=('SKIP'
            'e6ac036dfef2f6183ebab83d4252ab2cba225821aee2371bfd48c9ef1fcf72b1')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/"${_gitname}"/application/
  mvn assembly:assembly
}

package() {
  install -d -m755 "${pkgdir}"/usr/{share/java/arara,share/arara/tools,docs}
  install -Dm 755 "arara_launch" "${pkgdir}/usr/bin/arara"
  cp -r "${srcdir}/arara/docs" "${pkgdir}/usr/"
  cp -r "${srcdir}/arara/tools" "${pkgdir}/usr/share/arara/"
  cp -r "${srcdir}/arara/application" "${pkgdir}/usr/share/java/arara/"
  cp -r "${srcdir}/arara/rules" "${pkgdir}/usr/share/java/arara/application/target/"
}
