# All JT cores for MiSTer, including premium and beta content
# Maintainer: Alexandru M Stan <alex@hypertriangle.com>

buildarch=4

pkgname=jtpremium
pkgver=17.g5f50840
pkgrel=1
pkgdesc="All JT cores for MiSTer, including premium and beta content"
arch=('any')
url='https://github.com/jotego/jtpremium'
license=('GPL3')
source=('git+https://github.com/jotego/jtpremium.git#branch=main')
sha256sums=('SKIP')
_pkgfolder="jtpremium"

pkgver() {
  cd "${srcdir}/${_pkgfolder}"
  # there are no tags in this repo, so let's just make make one for the first commit
  git tag -f "firstcommit" 387130e2a2cf3d77b0b231f749242b57da02a544
  # and then use number of commits as a version
  git describe --tags --match firstcommit | sed 's/firstcommit.//g;s/-/./g'
}

package() {
  install ${srcdir}/${_pkgfolder}/_Arcade/cores/*.rbf  -Dt "${pkgdir}"/media/fat/_Arcade/cores/
  install ${srcdir}/${_pkgfolder}/_Arcade/*.mra -Dt "${pkgdir}"/media/fat/_Arcade/_jotego

  mkdir -p "${pkgdir}"/media/fat/_Arcade/_jotego/_Alternatives
  cp -r ${srcdir}/${_pkgfolder}/_Arcade/_alternatives/* "${pkgdir}"/media/fat/_Arcade/_jotego/_Alternatives
}
