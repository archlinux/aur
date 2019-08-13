# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=0.4.5
_commit=35752a3526db3289d721e38c8b778ee9d55e185a
pkgrel=1
pkgdesc='Console IRC client written in Rust'
arch=(i686 x86_64)
url=https://github.com/osa1/tiny
license=(MIT)
depends=(libdbus)
makedepends=(rustup)
source=(tiny-$pkgver.tar.gz::$url/archive/$_commit.tar.gz)
sha512sums=('f4d0d5c3708797dadc5b83ef773004d8a22a0fbb542c92ace88411856e262635bedf298b6f7a92091c7b8c05fde2f635ebe82424488d8ed100d9abc45afb73d0')

build() {
  cd tiny-$_commit
  rustup override set nightly
  cargo build --release
} 

check() {
  cd tiny-$_commit
  cargo test --release
}

package() {
  cd tiny-$_commit
  install -D target/release/tiny -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tiny
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tiny
}
