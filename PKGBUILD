# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com
# Contributor: Thermionix <thermionix at gmail dot com>

pkgname=navit
pkgver=0.5.6
pkgrel=6
pkgdesc="Modular turn-by-turn car navigation system"
arch=('x86_64')
url="https://www.navit-project.org/"
license=('GPL')
depends=('dbus-glib' 'gpsd' 'gtk2' 'imlib2' 'sdl_image')
makedepends=('cmake' 'libxslt')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/navit-gps/navit/archive/v$pkgver.tar.gz)
sha256sums=('043688e0b34504ca4ee80fb6a80895b938eae41e4031d0977dd30c20c20f1714')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/lib64/lib/' CMakeLists.txt 
}

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" -DSAMPLE_MAP=FALSE -DDISABLE_QT=TRUE
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
