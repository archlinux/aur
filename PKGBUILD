# Maintainer: Salan54 <salan at fremenil dot com>
# Created: 2013-03-17

pkgname=zulucrypt
pkgver=5.4.0
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
source=("https://github.com/mhogomchungu/zuluCrypt/releases/download/${pkgver}/${_altpkgname}-${pkgver}.tar.bz2")
md5sums=('420a7375229e52a2b8458ceb63ff9ee5')
sha256sums=('6cb499a1e9ec0f23f9411b192df5260eda601ac33c836e17370de2a33876b3e8')

build() {
  cd "${srcdir}/${_altpkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DLIB_SUFFIX=lib -DNOGUI=false -DQT5=true -DHOMEMOUNTPREFIX=false -DCMAKE_BUILD_TYPE=release . ..
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
