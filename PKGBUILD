# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers-svn
_pkgbranch=qtcharts
pkgver=r284
pkgrel=4
pkgdesc="DIY speaker design software"
url="http://brouits.free.fr/qspeakers/"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL3')
depends=('qt5-charts' 'shared-mime-info')
makedepends=('subversion')
conflicts=('qspeakers')
install=qspeakers-svn.install
source=(
  "${pkgname}::svn://svn.gtmp.org/qspeakers/branches/${_pkgbranch}"
)
 
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt5 PREFIX=/usr -config release
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
