# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>
# Contributor: Johannes Sjolund <j.sjolund@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnome-commander
pkgver=1.14.3
_pkgver=1.14
pkgrel=1
pkgdesc='Graphical two-pane filemanager for Gnome'
arch=('i686' 'x86_64')
url='http://gcmd.github.io/'
license=('GPL')
depends=('python' 'libgsf' 'exiv2' 'taglib' 'poppler-glib' 'libunique3' 'gtk2')
makedepends=('perl-xml-parser' 'itstool' 'yelp-tools')
validpgpkeys=('7627E6FCECF4FC066A03B673F50A89A3ADE4C6E8') # Uwe Scholz
_validpgpkeys=$(echo $validpgpkeys|tr -d \'|tr -d \( |tr -d \))
source=("https://download.gnome.org/sources/$pkgname/${_pkgver}/$pkgname-$pkgver.tar.xz"
	"https://keys.openpgp.org/vks/v1/by-fingerprint/$_validpgpkeys")
sha256sums=('78d8dce70fb922b2909cf767783053b0811213a4d6a49b3875510cf3a84efd7b'
            'efbe5516e7d781b72b33c4441558e600e4ce9b00e76355a709d25eb4fe24a0e9')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc \
	      --localstatedir=/var --with-help-dir=/usr/share/doc/$pkgname
  make
}

package() {
  cd "$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
