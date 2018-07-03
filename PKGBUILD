# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy
pkgver=3.0.0~dev1+74+gf3e3905
pkgrel=1
pkgdesc='In-development SSH-alike that uses the Noise protocol'
arch=(any)
url=https://github.com/oxy-secure/oxy
license=(BSD-2-Clause)
makedepends=(git)
depends=(cargo)
conflicts=(oxy-git)
source=(git+https://github.com/oxy-secure/oxy)
sha512sums=(SKIP)

pkgver() {
  cd $srcdir/oxy
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/~/)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

build() {
  cd oxy
  cargo build --release --locked
}

package() {
  cd oxy
  install -Dm 755 target/release/oxy $pkgdir/usr/bin/oxy
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/oxy/LICENSE
}
