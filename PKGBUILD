# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com
# Contributor: Thermionix <thermionix at gmail dot com>

pkgname=navit
pkgver=0.5.4
pkgrel=1
pkgdesc="Modular turn-by-turn car navigation system"
arch=('x86_64')
url="https://www.navit-project.org/"
license=('GPL')
depends=('dbus-glib' 'gpsd' 'gtk2' 'imlib2' 'sdl_image')
makedepends=('cmake' 'libxslt')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/navit-gps/navit/archive/v$pkgver.tar.gz)
sha256sums=('728d9dcad00e97769f6cd85bfad5518b0edf62ef75d60543fa4c48c1c3ab1243')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/lib64/lib/' CMakeLists.txt 
}

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DSAMPLE_MAP=FALSE -DDISABLE_QT=TRUE
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
