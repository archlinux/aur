# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=qnapi
pkgver=0.1.6_rc2
pkgrel=4
pkgdesc="Qt4 client for downloading movie subtitles from NAPI Project"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/qnapi/"
license=('GPL')
depends=('qt4' 'p7zip')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver/_/-}.tar.gz")
md5sums=('84daa5dea51e8612bda26bdc4361ea62')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"

  sed -i 's!/usr/share/apps/!/opt/kde/share/apps/!' qnapi.pro
  sed -i 's!/usr/lib/kde4/share/kde4/services/ServiceMenus!/usr/share/kde4/services/ServiceMenus!' qnapi.pro
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"

  unset QTDIR

  qmake-qt4 || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"

  make INSTALL_ROOT="${pkgdir}/" install
}
