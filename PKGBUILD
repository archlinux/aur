# Maintainer: shaddow - Daniel Dietrich <shaddow2k@gmail.com>
# Contributor: (epsilom) Xavier Corredor <xavier.corredor.llano (at) gmail.com>
# Contributor: alexwizard

pkgname=kdeplasma-applets-homerun-git
pkgver=v1.2.4.14.ged1cfc9
pkgrel=1
pkgdesc="An application launcher for KDE Plasma desktop - git version"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/index.php?p=homerun.git&a=summary"
license=('GPL' 'LGPL' 'BSD')
depends=('kdebase-workspace' 'kdebase-lib')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl')
provides=("kdeplasma-applets-homerun")
conflicts=("kdeplasma-applets-homerun")
install="${pkgname}.install"
source=(${pkgname}::git://anongit.kde.org/homerun.git)
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  mkdir -p build
  cd build

  cmake ../${pkgname} \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
}

 
