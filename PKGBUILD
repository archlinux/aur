# Maintainer: Caio Novais <caionov08 at gmail dot com>
pkgname=whatsapp-for-linux
pkgver=1.0.8
pkgrel=1
pkgdesc="An unofficial WhatsApp linux client desktop application."
arch=('x86_64')
url="https://github.com/eneshecan/$pkgname"
license=('GPL')
depends=('gtkmm3' 'webkit2gtk')
makedepends=('cmake')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/eneshecan/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('3f12c2909b1d60cc1c247e29f9f4b834c18c7494')

build() {
  cd "$srcdir/$pkgname-$pkgver" || exit
  mkdir -p build/debug && cd build/debug || exit
  cmake -DCMAKE_BUILD_TYPE=Debug ../..
  make
}

package() {
  msg2 "Copying binary..."
  install -Dm755 "$srcdir/$pkgname-$pkgver/build/debug/$pkgname" "$pkgdir/usr/bin/$pkgname"

  msg2 "Copying resources..."
  # .desktop
  install -Dm644 "$srcdir/$pkgname-$pkgver/resource/desktop/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Icons
  for i in 16x16 32x32 64x64 128x128 256x256; do
    install -Dm644 "$srcdir/$pkgname-$pkgver/resource/image/icons/hicolor/$i/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png"
  done
}
