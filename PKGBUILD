# Contributor: Klaus Drechsler <drechsler@gmx.net>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.16.2
_pkgver=1.16
pkgrel=1
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('libgsf' 'taglib' 'poppler-glib' 'gtk2' 'exiv2' 'smbclient')
makedepends=('itstool' 'meson' 'gtest' 'flex' 'glib2-devel')
source=("https://download.gnome.org/sources/$pkgname/${_pkgver}/$pkgname-$pkgver.tar.xz")

sha256sums=('7cf5d56c77a95d828f25407294312abaae20dc6b556ceafd9424dbfe209e5ed3')
build() {
  cd "$pkgname-$pkgver"
   meson setup --prefix=/usr --buildtype=plain build -Dunique=disabled
   meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"
  meson test -C build --print-errorlogs
}

package() {
  cd "$pkgname-$pkgver"
  GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" ninja -C build install
}

prepare() {
  cd "$pkgname-$pkgver"
}
