# $Id: PKGBUILD 68598 2012-03-29 08:03:13Z arodseth $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
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
depends=('file' 'qt5-quick1' 'ccrtp' 'ilbc' 'bcg729')
makedepends=('pkg-config' 'boost' 'cmake')
source=("git+https://github.com/LubosD/$_pkgname.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
  :
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build

  cmake .. -DWITH_ALSA=On -DWITH_SPEEX=On -DWITH_ILBC=On -DWITH_G729=On -DWITH_QT5=On -DCMAKE_INSTALL_PREFIX=/usr # -DWITH_ZRTP=On
  make
}

package() {
  cd "$_pkgname/build"

  make DESTDIR="$pkgdir" install
#  install -Dm644 "$pkgdir/usr/share/twinkle/twinkle48.png" \
#    "$pkgdir/usr/share/pixmaps/twinkle.png"
#  install -Dm644 twinkle.desktop \
#    "$pkgdir/usr/share/applications/twinkle.desktop"
}
