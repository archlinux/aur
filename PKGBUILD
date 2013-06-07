# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

pkgname=qtweetlib-git
pkgver=0.5.135.gad8fa29
pkgrel=1
epoch=1
pkgdesc="C++ Qt based Twitter library - development version"
arch=('i686' 'x86_64')
url="https://github.com/minimoog/QTweetLib"
license=('GPL2')
depends=('qjson')
makedepends=('git' 'cmake')
provides=('qtweetlib')
conflicts=('qtweetlib')
source=("${pkgname}::git://github.com/minimoog/QTweetLib.git")
md5sums=('SKIP')

if [[ ! ${_buildtype} == "Release" ]] && [[ ! ${_buildtype} == "release" ]]; then
  options=(!strip)
fi

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --always --tags | sed 's|-|.|g'
}

build() {
  cd ${srcdir}/${pkgname}

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
}
