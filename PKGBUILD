# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds
# Maintainer:  Solomon Choina <shlomochoina(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.

_buildtype='Release'

##############################################################

pkgname=tomahawk-git
pkgver=0.8.0rc1.1337.g777b31219
pkgrel=1
epoch=1
pkgdesc='A Music Player App written in C++/Qt - development version'
arch=('i686' 'x86_64')
url='http://tomahawk-player.org/'
license=('GPL3')
depends=('qt5-svg' 'qt5-tools' 'qt5-xmlpatterns' 'qt5-x11extras' 'qca'
         'taglib' 'lucene++' 'libechonest' 'jreen' 'quazip' 'attica'
         'qt5-webkit' 'liblastfm-qt5' 'qtkeychain' 'vlc')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'sparsehash' 'boost')
optdepends=('kdelibs: integration with Plasma Desktop'
            'telepathy-qt: integration with Telepathy')
provides=('tomahawk')
conflicts=('tomahawk' 'tomahawk-qt5')
source=("${pkgname}::git://github.com/tomahawk-player/tomahawk.git")
sha256sums=('SKIP')

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options=('debug')
fi

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --always --tags | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/tomahawk \
        -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
