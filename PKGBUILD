# Maintainer: Salan54 <salan at fremenil dot com>
# Created: 2013-03-17

pkgname=zulucrypt
pkgver=5.0.1
pkgrel=1
_altpkgname=zuluCrypt
pkgdesc="A cli and gui frontend to cryptsetup"
url="http://mhogomchungu.github.io/${_altpkgname}"
arch=('x86_64' 'i686')
license=('GPL')
depends=('cryptsetup' 'qt5-base' 'libpwquality' 'libsecret' 'libxkbcommon-x11' )
optdepends=('kwalletmanager: retrieve volume keys from kde kwallet')
conflicts=('zulucrypt-git')
makedepends=('cmake')
options=('!buildflags')
source=("https://github.com/mhogomchungu/zuluCrypt/releases/download/${pkgver}/${_altpkgname}-${pkgver}.tar.bz2")
md5sums=('f1b472b7d56784e5968d8ecb22b7951b')
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
  cd "${srcdir}/${_altpkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  mkdir -p ${pkgdir}/etc/modules-load.d
  echo 'loop' > "${pkgdir}/etc/modules-load.d/${pkgname}.conf"
}
