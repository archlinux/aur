# Maintainer: Sasha Romijn <arch at mxsasha.eu>
pkgname=bgpq4
pkgver=1.5
pkgrel=1
pkgdesc="BGP filtering automation tool based on IRR data"
arch=('x86_64' 'aarch64')
url="https://github.com/bgp/bgpq4"
license=('BSD')
source=("${pkgver}.tar.gz::https://github.com/bgp/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('b0d552634db6e7a90f76387b22c3539b59c5f89f9564b661bc810f9a9729f0dd87931a64fc230b8ed0a38162a572d8d93139a792ee80e996663b47ec3e060b9b')
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
