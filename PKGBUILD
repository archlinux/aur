# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=0.4.4+526+g35752a3
_commit=35752a3526db3289d721e38c8b778ee9d55e185a
pkgrel=1
pkgdesc='Console IRC client written in Rust'
arch=(i686 x86_64)
url=https://github.com/osa1/tiny
license=(MIT)
depends=(openssl dbus)
makedepends=(git rust-nightly)
source=(git+$url#commit=$_commit)
sha512sums=(SKIP)

pkgver() {
  cd tiny
  printf %s+%s+%s $(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2) $(git rev-list --count HEAD) g$(git describe --always)
}

build() {
  cd tiny
  cargo +nightly build --release
} 

check() {
  cd tiny
  cargo +nightly test --release
}

package() {
  cd tiny
  install -D target/release/tiny -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tiny
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tiny
}
