# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy-git
pkgver=3.0.0+dev1+85+g46013cc
pkgrel=1
pkgdesc='In-development SSH-alike that uses the Noise protocol (Git)'
arch=(any)
url=https://github.com/oxy-secure/oxy
license=(BSD-2-Clause)
makedepends=(git rust-nightly)
provides=(oxy)
conflicts=(oxy)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd $srcdir/oxy
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

build() {
  cd oxy
  cargo +nightly build --release --locked
}

package() {
  cd oxy
  install -D target/release/oxy $pkgdir/usr/bin/oxy
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/oxy/LICENSE
}
