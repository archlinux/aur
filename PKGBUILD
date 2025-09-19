# Maintainer: Salan54 <salan at fremenil dot com>
# Created: 2013-03-17

pkgname=zulucrypt
pkgver=7.1.0
pkgrel=1
_altpkgname=zuluCrypt
pkgdesc="A cli and gui frontend to cryptsetup"
url="https://mhogomchungu.github.io/${_altpkgname}"
arch=('x86_64' 'i686')
license=('GPL-2.0-or-later')
depends=('cryptsetup' 'qt5-base' 'libpwquality' 'libsecret' 'libxkbcommon-x11' 'util-linux')
optdepends=('kwalletmanager: retrieve volume keys from kde kwallet')
conflicts=('zulucrypt-git')
makedepends=('cmake')
source=("https://github.com/mhogomchungu/zuluCrypt/releases/download/${pkgver}/${_altpkgname}-${pkgver}.tar.xz")
md5sums=('bfd7b4ea12355ff132a5f5faacbe553e')
sha256sums=('7631f6b2807f0138dd2895bb6e026912d4de9d67321759d15fbe691f23271959')

build() {
  cd "${srcdir}/${_altpkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DLIB_SUFFIX=lib -DNOGUI=false -DQT5=true -DHOMEMOUNTPREFIX=false -DCMAKE_BUILD_TYPE=release -DWITH_UUID=e2fs . ..
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
