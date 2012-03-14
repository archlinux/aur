# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

pkgname=jreen
_name=lib${pkgname}
pkgver=1.0.3
pkgrel=1
pkgdesc="Qt XMPP library"
arch=('i686' 'x86_64')
url="https://github.com/euroelessar/jreen"
license=('GPL2')
depends=('libidn' 'qca-ossl' 'zlib')
makedepends=('cmake')
provides=('jreen')
conflicts=('jreen-git')
options=(!strip)
source=(http://qutim.org/dwnl/29/${_name}-${pkgver}.tar.bz2)
md5sums=('d60c85473352feff10cecc7bfbf0f49e')
 
# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

build() {
  msg "Starting build..."

  if [[ -e ${srcdir}/${_name}-${pkgver}-build ]]; then rm -rf ${srcdir}/${_name}-${pkgver}-build; fi
  mkdir ${srcdir}/${_name}-${pkgver}-build
  cd ${srcdir}/${_name}-${pkgver}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_buildtype} ../${_name}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_name}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
