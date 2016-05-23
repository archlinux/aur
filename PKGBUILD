# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>

pkgname=qspeakers-svn
pkgver=r115
pkgrel=1
pkgdesc="DIY speaker design software"
url="http://brouits.free.fr/qspeakers/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qwt-qt5' 'shared-mime-info')
makedepends=('subversion')
conflicts=('qspeakers')
install=qspeakers-svn.install
source=(
  "${pkgname}::svn+https://svn.gtmp.org/svn/qspeakers/"
  "qwt-qt5.patch"
)
 
sha256sums=(
  'SKIP'
  'de92668169f5677c441007c0d59688dded4ae1f33c0a598eec2f70e08144b83d'
)

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}" 
}

build() {
  cd "${srcdir}/$pkgname"
  patch -Np1 -i ../qwt-qt5.patch
  qmake-qt5 PREFIX=/usr -config release
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
