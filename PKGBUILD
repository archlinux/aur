# Maintainer: Gur0v
pkgname=zeptofetch
pkgver=1.18
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux"
arch=('x86_64')
url="https://gitlab.archlinux.org/gurov/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.archlinux.org/gurov/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c1e68c6bb6f98409b29435cf540eee73b31dd89624868e9371a520a356d3c068')
options=('!strip')

build() {
  cd "$pkgname-v$pkgver"
  unset CFLAGS
  unset LDFLAGS
  make
}

package() {
  cd "$pkgname-v$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
