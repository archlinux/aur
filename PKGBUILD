# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers-svn
pkgver=r266
pkgrel=1
pkgdesc="DIY speaker design software"
url="http://brouits.free.fr/qspeakers/"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL3')
depends=('qt5-charts' 'shared-mime-info')
makedepends=('subversion')
conflicts=('qspeakers')
install=qspeakers-svn.install
source=(
  "${pkgname}::svn+https://svn.gtmp.org/svn/qspeakers/branches/qtcharts"
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
  cd "${srcdir}/$pkgname"
  qmake-qt5 PREFIX=/usr -config release
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
