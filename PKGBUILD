# Contributor: Klaus Drechsler <drechsler@gmx.net>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.16.1
_pkgver=1.16
pkgrel=2
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('libgsf' 'taglib' 'poppler-glib' 'gtk2' 'exiv2' 'smbclient')
makedepends=('itstool' 'meson' 'gtest')
source=("https://download.gnome.org/sources/$pkgname/${_pkgver}/$pkgname-$pkgver.tar.xz"
	gnome-commander-1.16.1.patch)

sha256sums=('3f1d00c4a650fe7902167648286b32c9ca4ef86e31a5d8ccca0139f12d10d0b3'
            '91825e18ec8924e74364765cf80e82264968657ce82b4d2fc2948cfa2746b665')
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
  patch --strip=1 --input=../gnome-commander-1.16.1.patch
}
