# Maintainer: Dominic Brekau <aur@dominic.brekau.de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=twinkle-qt5
_pkgname=twinkle
pkgver=1.10.2
pkgrel=3
pkgdesc="Softphone for voice over IP and IM communication using SIP"
arch=('x86_64' 'i686')
url="http://www.twinklephone.com/"
license=('GPL')
depends=('file' 'libsndfile' 'gsm' 'speex' 'qt5-declarative' 'ccrtp' 'ilbc' 'libzrtpcpp')
makedepends=('boost' 'cmake' 'git' 'qt5-tools' 'alsa-lib')
source=("git+https://github.com/LubosD/$_pkgname.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DWITH_QT5=ON -DWITH_ALSA=ON -DWITH_GSM=ON -DWITH_SPEEX=ON -DWITH_ZRTP=ON -DWITH_ILBC=ON # -DWITH_G729=On
  make
}

package() {
  cd "$_pkgname/build"

  make DESTDIR="$pkgdir" install
}
