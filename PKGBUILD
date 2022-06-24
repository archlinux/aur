# Maintainer: whoami <whoami@systemli.org>
# Contributor: Robert Holt <holt.r94 at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Yorhel <projects@yorhel.nl>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=ncdc
pkgver=1.23
pkgrel=1
pkgdesc='Modern and lightweight direct connect client with a friendly ncurses interface'
arch=('i686' 'x86_64' 'arm' 'armv6h')
url='http://dev.yorhel.nl/ncdc'
license=('MIT')
depends=('gnutls' 'sqlite' 'glib2' 'libmaxminddb')
source=(
  "http://dev.yorhel.nl/download/$pkgname-$pkgver.tar.gz"{,.asc}
  uit_dl.c.patch
)
validpgpkeys=('74460D32B80810EBA9AFA2E962394C698C2739FA') # Yoran Heling, only used for releases

prepare() {
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/uit_dl.c.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-geoip
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=(
	'c1b2098df517631a64b24efaeb328a796ed716dca08b61248bb39bba866055ce1e017f33cc594197824476ec65ada53b13bfb56878b5b8aa330288017ad15df2'
	'SKIP'
	'8a4f10ecb9da5793fa4c705360b8a8e92206ac3b327507387bc4f22290bc2c77b4291f258d196d6bc63358324979b642e0ec579dff92405a5b209b2921b33f35'
)
