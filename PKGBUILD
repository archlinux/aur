# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

pkgname=qtweetlib
pkgver=0.3
pkgrel=1
_rev=f0442f6
pkgdesc="C++ Qt based Twitter library"
arch=('i686' 'x86_64')
url="https://github.com/minimoog/QTweetLib"
license=('GPL2')
depends=('qjson')
makedepends=('cmake>=2.8')
provides=('qtweetlib')
conflicts=('qtweetlib-git')
options=(!strip)
source=(https://github.com/minimoog/QTweetLib/tarball/0.3)
md5sums=('a37055e7c081049294efb42126933cef')

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build(){
  msg "Starting build..."

  rm -rf ${srcdir}/${pkgname}-build
  mv ${srcdir}/minimoog-QTweetLib-${_rev} ${srcdir}/${pkgname}-build
  cd ${srcdir}/${pkgname}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd ${srcdir}/${pkgname}-build
  make DESTDIR=${pkgdir} install
}
