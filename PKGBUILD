# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.

_buildtype='Release'

##############################################################

pkgname=libechonest
pkgver=2.3.0
pkgrel=2
pkgdesc='C++ library for interfacing with Echo Nest'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/libs/libechonest'
license=('GPL')
depends=('qjson')
makedepends=('cmake')
conflicts=('libechonest-git' 'libechonest2')
replaces=('libechonest2')
source=("http://files.lfranchi.com/${pkgname}-${pkgver}.tar.bz2")
md5sums=('9a740f7a8eb7d79ab013593bb52544b6')

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options=('debug')
fi

prepare() {
  if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${pkgname}-${pkgver}-build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        -DECHONEST_BUILD_TESTS=off \
        ../${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
