# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is DebugFull to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

pkgname=tomahawk
pkgver=0.1
pkgrel=1
pkgdesc="A Music Player App written in C++/Qt"
arch=('i686' 'x86_64')
url="http://tomahawk-player.org/"
license=('GPL3')
depends=('phonon>=4.5.0' 'taglib>=1.6.2' 'boost>=1.30' 'clucene-git' 'libechonest-git' 'jreen-git' 'qtweetlib-git')
makedepends=('git' 'cmake>=2.8.0')
provides=('tomahawk')
conflicts=('tomahawk-git')
options=(!strip)
source=(http://download.tomahawk-player.org/tomahawk-${pkgver}.tar.bz2)
md5sums=('a2716c41c7c7720e4dd8336c6b73609c')
install=tomahawk.install

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {
  
  msg "Starting build..."

  rm -rf ${srcdir}/${pkgname}-${pkgver}-build
  cp -r ${srcdir}/${pkgname}-${pkgver} ${srcdir}/${pkgname}-${pkgver}-build
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
