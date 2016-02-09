# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=twinkle-qt5
_pkgname=twinkle
pkgver=1.9.0
pkgrel=1
pkgdesc="Softphone for voice over IP and IM communication using SIP"
arch=('x86_64' 'i686')
url="http://www.twinklephone.com/"
license=('GPL')
depends=('file' 'qt5-quick1' 'ccrtp' 'ilbc')
makedepends=('pkg-config' 'boost' 'cmake' 'git' 'qt5-tools')
source=("git+https://github.com/LubosD/$_pkgname.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DWITH_ALSA=On -DWITH_SPEEX=On -DWITH_ILBC=On -DWITH_QT5=On # -DWITH_ZRTP=On -DWITH_G729=On
  make
}

package() {
  cd "$_pkgname/build"

  make DESTDIR="$pkgdir" install
}
