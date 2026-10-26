# Maintainer: Gurov <thuggerthugger1@duck.com>
pkgname=zeptofetch
pkgver=2.2
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux"
arch=('x86_64')
url="https://gitlab.archlinux.org/gurov/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('5c934445fd8793c7aeb1360993e8d2043c66d52a4ae2240530bb04ef084e2c2f')

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
