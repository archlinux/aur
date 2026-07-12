# Maintainer: Gurov <gurov@disroot.org>
pkgname=zeptofetch
pkgver=2.1
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux"
arch=('x86_64')
url="https://gitlab.archlinux.org/gurov/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('4754d7fc2a829e195cd2dc78fde2bfb334a47dbe584e9672f8c2d7b983a4c27e')

build() {
  cd "$pkgname-v$pkgver"
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" STRIP=true
}

check() {
  cd "$pkgname-v$pkgver"
  make check
}

package() {
  cd "$pkgname-v$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
