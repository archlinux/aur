# Maintainer: Christian Visintin <christian dot visintin at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=termscp
pkgver=0.13.0
pkgrel=1
pkgdesc="A feature rich terminal UI file transfer and explorer"
url="https://github.com/veeso/termscp"
license=("MIT")
arch=("any")
depends=('gcc-libs' 'glibc' 'zlib' 'openssl' 'dbus')
makedepends=('rust')
source=("$pkgname-0.13.0.tar.gz::$url/archive/refs/tags/v0.13.0.tar.gz")
sha256sums=('26167374d619ced9fad84382dbdffbec861a36a20224b4ecdc955e732881e367')

prepare() {
   cd "$pkgname-0.13.0"
   cargo fetch
}

build() {
   cd "$pkgname-0.13.0"
   cargo build --release --target-dir=target
}

check() {
   cd "$pkgname-0.13.0"
}

package() {
   cd "$pkgname-$pkgver"
   cargo install \
      --no-track \
      --path . \
      --root "${pkgdir}"/usr
   install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
   install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
