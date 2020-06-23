# Maintainer: Caio Novais <caionov08 at gmail dot com>
pkgname=whatsapp-for-linux
pkgver=1.0.6
pkgrel=1
pkgdesc="An unofficial WhatsApp linux client desktop application."
arch=('x86_64')
url="https://github.com/eneshecan/$pkgname/releases"
license=('GPL')
depends=('gtkmm3' 'webkit2gtk')
makedepends=('cmake')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/eneshecan/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b77d554cea71293ffebcca0e99d5cdcf')

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
  # *.desktop
  install -Dm644 $pkgname-$pkgver/resource/desktop/$pkgname.desktop ../pkg/$pkgname/usr/share/applications/$pkgname.desktop

  # Icons
  for i in 16x16.ico 32x32.ico 48x48.ico 64x64.ico 128x128.ico 256x256.ico; do
    install -Dm644 $pkgname-$pkgver/resource/icon/$i ../pkg/$pkgname/usr/share/icons/hicolor/${i/.ico/}/apps/$pkgname.ico
  done
}
