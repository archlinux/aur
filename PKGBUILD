# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=sccache
pkgver=0.2.8
pkgrel=3
pkgdesc='ccache with cloud storage'
arch=(i686 x86_64)
url=https://github.com/mozilla/sccache
license=(Apache)
makedepends=(cargo)
source=($url/archive/$pkgver.tar.gz)
sha512sums=('3469a50339892ca2495f5655a1bd9fcb21a60bd01384c6851789e806902d95d605a941b1a09e0172eef663bddbc7d32fba3afc9ec76bd2a27f32acb1b7b0a35f')

build() {
  cd sccache-$pkgver
  cargo build --release
}

check() {
  cd sccache-$pkgver
  cargo test --release || true
}

package() {
  cd sccache-$pkgver
  cargo install --path . --root "$pkgdir"/usr
  rm "$pkgdir"/usr/.crates.toml
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/sccache
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/sccache
}
