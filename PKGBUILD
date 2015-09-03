# Maintainer: Salan54 <salan at fremenil dot com>
# Created: 2013-03-17
# QT4 version
pkgname=zulucrypt
pkgver=4.7.7
pkgrel=2
_altpkgname=zuluCrypt
pkgdesc="a cli and gui frontend to cryptsetup."
url="http://mhogomchungu.github.io/zuluCrypt/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('cryptsetup' 'qt5-base' 'libpwquality' 'libsecret' 'qt5-xmlpatterns' )
optdepends=('kdeutils-kwalletmanager: retrieve volume keys from kde kwallet')
conflicts=('zulucrypt-git')
makedepends=('cmake')
options=('!buildflags')
source=("https://github.com/mhogomchungu/zuluCrypt/releases/download/${pkgver}/${_altpkgname}-${pkgver}.tar.bz2")
md5sums=('7d166491967f8ee67876fcdf07d0f52e')
changelog=${pkgname}.changelog
install=${pkgname}.install

build() {
  cd "${srcdir}/${_altpkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DLIB_SUFFIX=lib -DNOGUI=false -DQT5=true -DHOMEMOUNTPREFIX=false -DNOKDE=true -DCMAKE_BUILD_TYPE=release . ..
  make
}

package() {
  echo "changelog updated"
  cp "${srcdir}/${_altpkgname}-${pkgver}"/changelog ../${pkgname}.changelog
  cd "${srcdir}/${_altpkgname}-${pkgver}"
  cd build
  make DESTDIR="$pkgdir" install
}
 
# vim:set ts=2 sw=2 et:
