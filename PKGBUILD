# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rustbuster-git
pkgver=3.0.3.r8.gd3735cb
pkgrel=1
pkgdesc='A comprehensive web fuzzer and content discovery tool'
arch=('x86_64')
url="https://github.com/phra/rustbuster"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
provides=('rustbuster')
conflicts=('rustbuster')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
validpgpkeys=('91FF93D1B85D76B5')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dm 755 "target/release/rustbuster" -t "$pkgdir/usr/bin/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
