# Maintainer: Caio Novais <caionov08 at gmail dot com>
pkgname=whatsapp-for-linux
pkgver=1.0.7
pkgrel=1
pkgdesc="An unofficial WhatsApp linux client desktop application."
arch=('x86_64')
url="https://github.com/eneshecan/$pkgname"
license=('GPL')
depends=('gtkmm3' 'webkit2gtk')
makedepends=('cmake')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/eneshecan/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('903f3650211e5d44bf7c4020ade43923')

build() {
  cd $pkgname-$pkgver
  mkdir -p build/debug && cd build/debug
  cmake -DCMAKE_BUILD_TYPE=Debug ../..
  make
}

package() {
  msg2 "Copying binary..."
  install -Dm755 $pkgname-$pkgver/build/debug/$pkgname ../pkg/$pkgname/usr/bin/$pkgname

  msg2 "Copying resources..."
  # .desktop
  install -Dm644 $pkgname-$pkgver/resource/desktop/$pkgname.desktop ../pkg/$pkgname/usr/share/applications/$pkgname.desktop

  # Icons
  for i in 16x16 32x32 64x64 128x128 256x256; do
    install -Dm644 $pkgname-$pkgver/resource/image/icons/hicolor/$i/apps/$pkgname.png ../pkg/$pkgname/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done
}
