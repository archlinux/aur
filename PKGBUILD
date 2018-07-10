# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=0.4.2+491+gef56843
pkgrel=2
pkgdesc='Console IRC client'
arch=(any)
url=https://github.com/osa1/tiny
license=(MIT)
depends=(openssl dbus)
makedepends=(git rust-nightly)
conflicts=(tiny-irc-client-git)
source=(git+$url#commit=ef568435a18a00e5e239d989c81211a84d8d566b)
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
  install -D target/release/tiny $pkgdir/usr/bin/tiny
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/tiny/LICENSE
}
