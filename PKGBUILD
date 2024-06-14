# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit
pkgver=0.2.0_alpha
_pkgver="${pkgver//_/-}"
pkgrel=1
url="https://github.com/eugene-babichenko/fixit"
pkgdesc="A utility to fix mistakes in your commands."
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=("889f36b70d00251bc03e9634e568c5228f168faf0fac9ca31a47247cc122b7ea")

build() {
  cd "$pkgname-$_pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --locked --release
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
