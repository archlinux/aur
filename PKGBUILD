# Maintainer: Evann DREUMONT <arch at evann.dev>
pkgname=bgpq4
pkgver=1.16
pkgrel=1
pkgdesc="BGP filtering automation tool based on IRR data"
arch=('x86_64' 'aarch64')
url="https://github.com/bgp/bgpq4"
license=('BSD')
source=("${pkgver}.tar.gz::https://github.com/bgp/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('57cb2e1cafada488c85ba8f8103f9bee66ab339ee9c9d5571d240080f44d794b40e75a6bfddcdb096a61d54d7f814b0f5f7ac34aa92ba6ec0b989285dc9c9422')
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
