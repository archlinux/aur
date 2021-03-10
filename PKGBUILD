# Maintainer: lmartinez-mirror
# Contributor: donbex <ap dot m at runbox dot com>
pkgname=as-tree
pkgver=0.12.0
pkgrel=1
pkgdesc="Print a list of paths as a tree of paths"
arch=('x86_64')
url="https://github.com/jez/as-tree"
license=('custom:BOML')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2af03a2b200041ac5c7a20aa1cea0dcc21fb83ac9fe9a1cd63cb02adab299456')

prepare() {
  cd "$pkgname-$pkgver"
  # Update the lock file manually, will not build with --locked flag otherwise
  sed -i "s/version = \"0.11.1\"/version = \"$pkgver\"/" Cargo.lock
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
