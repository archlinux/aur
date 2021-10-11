# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: svartalf <self@svartalf.info>

pkgname=battop
pkgdesc="Interactive batteries viewer"
pkgver=0.2.4
pkgrel=2
arch=('x86_64')
url="https://github.com/svartalf/rust-battop"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/svartalf/rust-battop/archive/v${pkgver}.tar.gz")
sha512sums=('f5744a8ddcfe09f2547494d2a6e1b184b967c5e4439c7bd3d74e47a1579dc86192a68cc3acb1ae2122718a77e2ab45525625e8a58ce1609d4b458e080a151af2')

build() {
  cd "rust-$pkgname-$pkgver"

  # build fails with battery crate version < 0.7.5
  # Thank you for fix @arglebargle
  sed -i 's/battery = "^0.7"/battery = "^0.7.5"/' Cargo.toml
  cargo build --release
}

package_battop() {
  cd "rust-$pkgname-$pkgver"

  install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -D -m644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
