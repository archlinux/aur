# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.16.0
_pkgver=1.16
pkgrel=2
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('libgsf' 'exiv2' 'taglib' 'poppler-glib' 'libunique3' 'gtk2')
makedepends=('perl-xml-parser' 'itstool' 'yelp-tools' 'meson' 'ninja')
validpgpkeys=('7627E6FCECF4FC066A03B673F50A89A3ADE4C6E8') # Uwe Scholz
_validpgpkeys=$(echo $validpgpkeys|tr -d \'|tr -d \( |tr -d \))
source=("https://download.gnome.org/sources/$pkgname/${_pkgver}/$pkgname-$pkgver.tar.xz"
	"https://keys.openpgp.org/vks/v1/by-fingerprint/$_validpgpkeys")
sha256sums=('d80ac70b99a7059c8f28ca0bf37305f09daeaecfceb1528d68a435ace9e8ec5d'
            'ff9228a02fe02d4e64483021d355a79b6fa76bf7e4be5a3bdc163ce16d6c1177')

build() {
  cd "$pkgname-$pkgver"
   meson --prefix=/usr --buildtype=plain build 
   ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" ninja -C build install
}
