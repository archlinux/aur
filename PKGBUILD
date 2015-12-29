# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds
# Maintainer:  Solomon Choina <shlomochoina(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.

_buildtype='RelWithDebInfo'

##############################################################

pkgname=tomahawk-git
pkgver=0.8.0rc1.1089.g8fbd3b9
pkgrel=1
epoch=1
pkgdesc='A Music Player App written in C++/Qt - development version'
arch=('i686' 'x86_64')
url='http://tomahawk-player.org/'
license=('GPL3')
depends=('qt5-svg' 'qt5-tools' 'qt5-xmlpatterns' 'qt5-x11extras' 'qca-qt5'
          'taglib' 'lucene++' 'libechonest-qt5' 'jreen'
          'quazip-qt5' 'attica-qt5' 'qt5-webkit' 'liblastfm-qt5'
          'qtkeychain-qt5' 'vlc')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'automoc4' 'sparsehash' 'boost' 'websocketpp')
optdepends=('kdelibs: integration with Plasma Desktop' 'telepathy-qt5: integration with Telepathy')
provides=('tomahawk')
conflicts=('tomahawk')
install=tomahawk.install
source=("${pkgname}::git://github.com/tomahawk-player/tomahawk.git")
md5sums=('SKIP')

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options=('debug')
fi

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --always --tags | sed 's|-|.|g'
}

build() {
  cd ${srcdir}/${pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/tomahawk \
        -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
}
