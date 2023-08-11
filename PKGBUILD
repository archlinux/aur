# Maintainer: Sasha Romijn <arch at mxsasha.eu>
pkgname=bgpq4
pkgver=1.11
pkgrel=1
pkgdesc="BGP filtering automation tool based on IRR data"
arch=('x86_64' 'aarch64')
url="https://github.com/bgp/bgpq4"
license=('BSD')
source=("${pkgver}.tar.gz::https://github.com/bgp/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0e7dbe450ab38b69675c0c7ecd6e06c8122d6d39902495f69c9722eb422337d90bf026bb0584e6f8990402cbd9c1f0e02d7b389aee9b70bad05fce431942c929')
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
