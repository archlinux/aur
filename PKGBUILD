# Maintainer: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.

_buildtype='Release'

##############################################################

pkgname=jreen
pkgver=1.2.1
pkgrel=1
pkgdesc='Free and Opensource Jabber library, written in C++ using cross-platform framework Qt.'
arch=('i686' 'x86_64')
url='http://qutim.org/jreen'
license=('GPL2')
depends=('gsasl' 'speex' 'qt4')
makedepends=('cmake')
provides=('jreen')
conflicts=('jreen-git')
source=("${pkgname}-${pkgver}.zip::http://github.com/euroelessar/${pkgname}/archive/v${pkgver}.zip")
md5sums=('af381d1032df0c0ab743b720df31c392')

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options=('debug')
fi

prepare() {
  if [[ -e ${pkgname}-${pkgver}-build ]]; then rm -rf ${pkgname}-${pkgver}-build; fi
  mkdir ${pkgname}-${pkgver}-build
}

build() {
  cd ${pkgname}-${pkgver}-build

  cmake -DJREEN_FORCE_QT4=yes \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \ 
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${pkgname}-${pkgver}

  make
}

package() {
  cd ${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
