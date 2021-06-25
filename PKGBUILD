# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Cian Mc Govern <cian@cianmcgovern.com>
# Contributor: Ian Abbott <ian at abbott dot org>
# Contributor: Zbyszek Tokarczyk <ztokarczyk at gmail dot com>

pkgname=wally
pkgver=2.4.5
pkgrel=5
pkgdesc="Qt4 desktop wallpaper changer, using multiple online and offline sources"
arch=('x86_64')
url="http://www.becrux.com/index.php?page=projects&name=wally"
license=('GPL')
depends=('qt4')
optdepends=('libexif: retrieve EXIF data')
makedepends=('cmake')
source=(http://www.becrux.com/pages/projects/$pkgname/$pkgname-$pkgver.tar.gz
        wally.desktop)
sha256sums=('deb8aecf3742a93b5051fdc9ca2144a4f88892a465cd4723e04ec2a07f2cca5e'
            'cd469489b216e46899a6fd01709c8f66809d33cf3cfe4f74ecbfefd09be69207')

build() {
  cmake -B build -S $pkgname-$pkgver -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS=-lX11 -Wno-dev
  make -C build
}

package() {
  install -Dm644 $pkgname-$pkgver/res/images/wally.png -t "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  install -Dm644 wally.desktop -t "$pkgdir/usr/share/applications"
  make -C build DESTDIR="$pkgdir/" install
}

