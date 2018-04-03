# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Cian Mc Govern <cian@cianmcgovern.com>
# Contributor: Ian Abbott <ian at abbott dot org>
# Contributor: Zbyszek Tokarczyk <ztokarczyk at gmail dot com>

pkgname=wally
pkgver=2.4.5
pkgrel=4
pkgdesc="Qt4 desktop wallpaper changer, using multiple online and offline sources"
arch=('x86_64')
url="http://www.becrux.com/index.php?page=projects&name=wally"
license=('GPL')
depends=('qt4')
optdepends=('libexif: retrieve EXIF data')
makedepends=('cmake' 'desktop-file-utils' 'gtk-update-icon-cache')
source=(http://www.becrux.com/pages/projects/$pkgname/$pkgname-$pkgver.tar.gz
        wally.desktop)
md5sums=('bd99473b23f42b5158341865fb6aa1bc'
         '5fe93f6b16e81d846a57e47136d9329a')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_EXE_LINKER_FLAGS=-lX11 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  install -Dm644 wally.desktop "$pkgdir/usr/share/applications/wally.desktop"

  cd $pkgname-$pkgver
  install -Dm644 res/images/wally.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/wally.png"
  make DESTDIR="$pkgdir/" install
}

