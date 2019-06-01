# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>

pkgname=arara
_gitname=arara
pkgver=4.0
pkgrel=2
pkgdesc='The cool TeX automation tool'
arch=('any')
url='https://github.com/cereda/arara'
license=('BSD')
conflicts=(arara-git)
depends=(java-environment-common maven)
makedepends=(git maven)
optdepends=('texlive-core: for compiling LaTeX documents')
source=("https://github.com/cereda/${pkgname}/archive/"${pkgver}".tar.gz" arara_launch)
md5sums=('c0e5f4b7f37fd571cf46ac16467fecbf'
         'efcf9e31c1b0d90cae192afc91a0d980')
sha256sums=('e9e2380c6709fa36b0ca52c776ae4944307e2bcf91e5a0b24077fbc09ea19093'
            'e6ac036dfef2f6183ebab83d4252ab2cba225821aee2371bfd48c9ef1fcf72b1')

build() {
  cd "${srcdir}"/"${_gitname}"-"${pkgver}"/application/
  mvn compile assembly:single
}

package() {
  install -d -m755 "${pkgdir}"/usr/{share/java/arara,share/arara/tools,docs}
  install -Dm 755 "arara_launch" "${pkgdir}/usr/bin/arara"
  cp -r "${srcdir}/arara-"${pkgver}"/docs" "${pkgdir}/usr/"
  cp -r "${srcdir}/arara-"${pkgver}"/tools" "${pkgdir}/usr/share/arara/"
  cp -r "${srcdir}/arara-"${pkgver}"/application" "${pkgdir}/usr/share/java/arara/"
  cp -r "${srcdir}/arara-"${pkgver}"/rules" "${pkgdir}/usr/share/java/arara/application/target/"
}
