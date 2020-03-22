# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=v0.5.1
_commit=0c2182c50d25d0048cd5b94dfd79e44cd0430408
pkgrel=1
pkgdesc='Console IRC client written in Rust'
arch=(i686 x86_64 aarch64)
url=https://github.com/osa1/tiny
license=(MIT)
depends=(libdbus)
makedepends=(git rustup)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd tiny
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd tiny
  rustup override set nightly
  cargo build --release --locked
} 

check() {
  cd tiny
  cargo test --release --locked
}

package() {
  cd tiny
  install -D target/release/tiny -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tiny
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tiny
}
