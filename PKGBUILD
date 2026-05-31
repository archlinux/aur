# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=gesso
pkgver=0.3.1
pkgrel=1
pkgdesc="Deterministic Wayland wallpaper daemon and CLI"
arch=('x86_64')
url="https://github.com/saltnpepper97/gesso"
license=('MIT')
depends=('wayland')
makedepends=('cargo' 'rust' 'pkgconf')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('878ad8d4ca1ebd03047f066962211692ba6472a86dedc415fc9314b816bee29f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/gesso" "$pkgdir/usr/bin/gesso"
  install -Dm755 "target/release/gessod" "$pkgdir/usr/bin/gessod"
  install -Dm644 "gesso.1" "$pkgdir/usr/share/man/man1/gesso.1"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
