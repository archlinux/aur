# Maintainer: Sasha Romijn <arch at mxsasha.eu>
pkgname=bgpq4
pkgver=0.0.7
pkgrel=1
pkgdesc="BGP filtering automation tool based on IRR data"
arch=('x86_64' 'aarch64')
url="https://github.com/bgp/bgpq4"
license=('BSD')
source=("${pkgver}.tar.gz::https://github.com/bgp/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('2c5432fdae94b2089af16ecf6ee9af3a4c03b473c5e1a1078676a5b3335192b192029151c6d2763163253bc19fcb7b3affc47eeeb54e363d540e067fe70d1954')
depends=('glibc')
makedepends=('python-markdown')

build() {
  cd "$pkgname-$pkgver"

  autoreconf --install .
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  make prefix="$pkgdir/usr" install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
