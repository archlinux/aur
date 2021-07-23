# Maintainer: Christian Visintin
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=termscp
pkgver=0.6.0
pkgrel=1
pkgdesc="A feature rich terminal UI file transfer and explorer"
url="https://github.com/veeso/termscp"
license=("MIT")
arch=("any")
depends=('gcc-libs' 'glibc' 'zlib' 'openssl' 'dbus')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99dd1d2f83f0df26e8f808a29e2c7249effa2ea526583d7de6bc9503fc632df3')

prepare() {
   cd "$pkgname-$pkgver"
   cargo fetch --locked
}

build() {
   cd "$pkgname-$pkgver"
   cargo build --release --locked --target-dir=target
}

check() {
   cd "$pkgname-$pkgver"
}

package() {
   cd "$pkgname-$pkgver"
   cargo install \
      --locked \
      --no-track \
      --path . \
      --root "${pkgdir}"/usr
   install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
   install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
