# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=parcittox-svn
pkgver=r43
pkgrel=1
pkgdesc='Adds the possibility to share clips over the network between Linux (running Parcittox) and Windows (running Ditto) PCs'
arch=('x86_64')
url='https://app.assembla.com/spaces/dittox/wiki#'
license=('GPL3')
conflicts=('parcittox' 'parcellite')
depends=('libappindicator-gtk2')
makedepends=('intltool')
source=("${pkgname%-svn}::svn+https://subversion.assembla.com/svn/dittox/")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-svn}/trunk/parcittox/"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${pkgname%-svn}/trunk/parcittox/"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-svn}/trunk/parcittox/"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: