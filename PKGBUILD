# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=amber-secrets
_pkgname=amber
pkgver=0.1.1
pkgrel=1
pkgdesc="Manage secret values in-repo via public key cryptography"
arch=("x86_64")
url="https://github.com/fpco/amber"
license=("MIT")
conflicts=('amber')
depends=('libsodium')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7c20e7953ac350cf70c1e964d8e2a43a1b3abf59452aee75724c85a9c04127c0')

build() {
  cd "$_pkgname-$pkgver"
  SODIUM_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
