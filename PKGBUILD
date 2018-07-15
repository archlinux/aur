# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy
pkgver=3.0.0+dev1+88+g8bafe66
pkgrel=1
pkgdesc='In-development SSH-alike that uses the Noise protocol'
arch=(any)
url=https://github.com/oxy-secure/oxy
license=(BSD-2-Clause)
makedepends=(git rust-nightly)
conflicts=(oxy-git)
source=(git+$url#commit=8bafe669127fe71785bccc1dcf078062aaca2508)
sha512sums=(SKIP)

pkgver() {
  cd $srcdir/oxy
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

build() {
  cd oxy
  cargo +nightly build --release
}

package() {
  cd oxy
  install -D target/release/oxy $pkgdir/usr/bin/oxy
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/oxy/LICENSE
}
