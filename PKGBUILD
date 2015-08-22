# Contributor: Tom Vincent <http://tlvince.com/contact>
# Maintainer: Patrick Wozniak <hello@patwoz.de>

pkgname=kwakd
pkgver=0.5
pkgrel=2
pkgdesc="A web server serving blank html pages"

url="https://code.google.com/p/kwakd/"
arch=( 'any' )
license=( "GPL" )

depends=( 'bash' )
makedepends=(
  'git'
)

source=(
  "$pkgname::http://kwakd.googlecode.com/files/$pkgname-$pkgver.tar.gz"
)
install="$pkgname.install"

sha256sums=(
  'ee87691c4ea971273a3c8926ee6f0cc754094567e27f165f890f2ce306f2afa4'
)

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
