pkgname=kgtk
pkgver=0.11.0
pkgrel=4
pkgdesc="LD_PRELOAD hack with helper scripts to make gtk and qt-only programs use KDE file dialogs."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=36077"
license=('GPL')
depends=('kdelibs')
makedepends=('pkgconfig' 'automoc4' 'cmake' 'gettext' 'gtk2>=2.6' 'gtk3>=3.0')
install=kgtk.install
source=(http://kde-apps.org/CONTENT/content-files/36077-KGtk-${pkgver}.tar.bz2)
md5sums=('e5abf37b9f15b301d213ffb881144ddb')

build() {
  cd "${srcdir}/KGtk-${pkgver}"

  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake "../KGtk-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4

  make || return 1
}

package()
{
  cd "${srcdir}/build"
  make DESTDIR=$pkgdir install || return 1
}
