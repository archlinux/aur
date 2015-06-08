# Maintainer: A Rojas <nqn1976 @ gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kmldonkey
pkgver=2.0.7
# _kdever=4.4.0
pkgrel=2
pkgdesc="An MLDonkey frontend for KDE"
arch=('i686' 'x86_64')
url='http://userbase.kde.org/KMLDonkey'
license=('GPL')
depends=('kdebase-runtime' 'mldonkey')
makedepends=('cmake' 'automoc4')
optdepends=('kdebase-workspace: to use the plasma applet')
install="${pkgname}.install"
source=("ftp://mirror.de.leaseweb.net/gentoo/distfiles/$pkgname-$pkgver.tar.bz2" 
"ftp://ftp.kde.org/pub/kde/stable/extragear/${pkgname}-2.0.2-kde4.4.0.tar.bz2")
md5sums=('52062ca60b3b449c82e9db0bad1bc31c'
         '40ae039dc01a45807111c2d0023eeaa6')

build() {
  cd ${srcdir}
 # add translations
  mv ${pkgname}-2.0.2-kde4.4.0/po ${pkgname}-${pkgver}/
  echo "find_package(Msgfmt REQUIRED)" >> ${pkgname}-${pkgver}/CMakeLists.txt
  echo "find_package(Gettext REQUIRED)" >> ${pkgname}-${pkgver}/CMakeLists.txt
  echo "add_subdirectory( po )" >> ${pkgname}-${pkgver}/CMakeLists.txt
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
