# Contributor: Tom Vincent <http://tlvince.com/contact>
# Maintainer: Patrick Wozniak <hello@patwoz.de>

pkgname=kwakd
pkgver=0.5
pkgrel=5
pkgdesc="A web server serving blank html pages"

url="https://code.google.com/p/kwakd/"
arch=( 'any' )
license=( "GPL" )

depends=( 'bash' )
makedepends=(
  'git'
)
conflicts=('kwakd-git')
source=(
  "$pkgname::https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-$pkgver.tar.gz"
  "$pkgname.service"
)
install="$pkgname.install"

sha256sums=(
  'ee87691c4ea971273a3c8926ee6f0cc754094567e27f165f890f2ce306f2afa4'
  '5ae20e1ef81436ba5452447c32c46db4d343f08f5abe0aa41076425a9cee4715'
)

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  echo "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
