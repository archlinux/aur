# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# https://github.com/zizzfizzix/pkgbuilds

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.

_buildtype='RelWithDebInfo'

##############################################################

pkgname=jreen-git
pkgver=1.3.0.r2.gc04c229
pkgrel=1
epoch=1
pkgdesc='Free and Opensource Jabber library, written in C++ using cross-platform framework Qt. - development version'
arch=('i686' 'x86_64')
url='https://github.com/euroelessar/jreen'
license=('GPL2')
depends=('gsasl' 'qt4' 'speex')
makedepends=('git' 'cmake')
provides=('jreen')
conflicts=('jreen')
source=("${pkgname}::git+https://github.com/euroelessar/jreen.git")
md5sums=('SKIP')

if [[ ! ${_buildtype} == 'Release' ]] && [[ ! ${_buildtype} == 'release' ]]; then
  options=('debug')
fi

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -DJREEN_FORCE_QT4=on \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
