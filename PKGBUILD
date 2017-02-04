# Maintainer: Michael Kogan photon89 at googlemail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Damir Perisa <damir@archlinux.org>

pkgname=glabels-light
_pkgname=glabels
pkgver=3.4.0
pkgrel=1
pkgdesc="Creating labels and business cards the very easy way - minimal dependencies"
arch=('i686' 'x86_64')
url="http://glabels.org/"
license=('GPL' 'LGPL')
depends=('librsvg' 'dconf' 'desktop-file-utils' 'xdg-utils')
optdepends=('evolution-data-server: import Evolution contacts'
				'qrencode: use QR codes'
				'iec16022: use barcodes')
conflicts=('glabels')
provides=('glabels')
makedepends=('intltool' 'itstool')
install=$_pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('d40e079395d30adbcd8204f41d08f7a8da9ec130bffa4cb3c130fbe2322b6410')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
