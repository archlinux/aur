# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=0.4.4+522+g5bebf81
pkgrel=1
pkgdesc='Console IRC client written in Rust'
arch=(i686 x86_64)
url=https://github.com/osa1/tiny
license=(MIT)
depends=(openssl dbus)
makedepends=(git rust-nightly)
conflicts=(tiny-irc-client-git)
source=(git+$url#commit=5bebf810fc237df8db7a1d988398399b2e1513c7)
sha512sums=(SKIP)

pkgver() {
  cd tiny
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2)+$(git rev-list --count HEAD)+g$(git describe --always)"
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
