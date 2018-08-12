# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=sccache
pkgver=0.2.7
pkgrel=1
pkgdesc='ccache-like tool with experimental Rust support'
arch=(i686 x86_64)
url=https://github.com/mozilla/sccache
license=(Apache)
makedepends=(rust)
conflicts=(sccache-bin sccache-git)
source=($url/archive/$pkgver.tar.gz)
sha512sums=('8df06c5540cdbeeaa352cdaa2dde436ceb2f0c3287945279c051763561ff8a76a88ace2b90da7134ff418daf80345c4dce9fc10d77c8756a0422f0f4725344f2')

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
  cargo install --root "$pkgdir"/usr
  rm "$pkgdir"/usr/.crates.toml
}
