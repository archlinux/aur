# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy
pkgver=3.0.0+105+g891cedf
_commit=891cedf8fd9945fbccd9e67f6644a80bc4963d81
pkgrel=2
pkgdesc='SSH-alike that uses the Noise protocol'
arch=(i686 x86_64)
url=https://github.com/oxy-secure/oxy
license=(BSD)
makedepends=(git rust)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd oxy
  printf %s+%s+g%s $(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/) $(git rev-list --count HEAD) $(git describe --always)
}

build() {
  cd oxy
  cargo build --release --locked
}

check() {
  cd oxy
  cargo test --release --locked || true
}

package() {
  cd oxy
  install -D target/release/oxy -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/oxy
}
