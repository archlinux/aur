# Maintainer: Sasha Romijn <arch at mxsasha.eu>
pkgname=bgpq4
pkgver=0.0.6
pkgrel=2
pkgdesc="BGP filtering automation tool based on IRR data"
arch=('x86_64' 'aarch64')
url="https://github.com/bgp/bgpq4"
license=('BSD')
source=("${pkgver}.tar.gz::https://github.com/bgp/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('d1d0e2edda7c90ee6dfdda81876678007f60e1ed2c71b75cf6affbf9706443d7d5643ad26170053cb82a26d421b17854ff31f181db2cd78766cfb8d7557e9307')
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
