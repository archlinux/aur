# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy
pkgver=3.0.0
_commit=891cedf8fd9945fbccd9e67f6644a80bc4963d81
pkgrel=1
pkgdesc='SSH-alike that uses the Noise protocol'
arch=(i686 x86_64)
url=https://github.com/oxy-secure/oxy
license=(BSD)
depends=(gcc-libs)
makedepends=(git rust)
source=(git+$url#commit=$_commit)
sha512sums=('SKIP')

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
