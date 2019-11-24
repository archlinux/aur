# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=0.5.0+r31+gfe2659b
_commit=fe2659b9f93b7d179181c9b4c3aaa7342ad853c4 # Tokio is a moving target, use a commit that builds with currently available libraries
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
