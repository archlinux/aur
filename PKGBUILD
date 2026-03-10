# Maintainer: Gur0v
pkgname=zeptofetch
pkgver=1.19
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux"
arch=('x86_64')
url="https://gitlab.archlinux.org/gurov/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.archlinux.org/gurov/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('9df1e931f5ffa7f58c99e279f9cf2d5c359dba7034da66a01fa49c411f426a51')
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
