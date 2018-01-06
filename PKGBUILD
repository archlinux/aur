# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Peter Kosyh <p.kosyhgmail.com>

pkgname=instead-launcher
pkgver=0.7.0
pkgrel=1
pkgdesc="launcher and games downloader for INSTEAD quest interpreter"
arch=('x86_64')
url="http://instead.syscall.ru/"
license=('GPL')
makedepends=('sed' 'qt4')
source=(http://downloads.sourceforge.net/project/instead/instead-launcher/instead-launcher_$pkgver.tar.gz)
sha256sums=('82e9575f23a3dd7527f658ff09603392dc54cdb58544cb3ed9675b446ef53d5c')

build() {
  cd "$srcdir"/instead-launcher-$pkgver
  sed -i 's|/usr/local/bin/sdl-instead|/usr/bin/sdl-instead|g' platform.cpp
  qmake-qt4 PREFIX=/usr
  make
}

package() {
  depends=('qt4' 'instead')
  cd "$srcdir"/instead-launcher-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
