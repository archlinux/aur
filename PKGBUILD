# Maintainer: RouHim

pkgname=binvec
pkgver=${VERSION}
pkgrel=1
pkgdesc="A simple application to convert raster graphics to vector graphics"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/RouHim/binvec"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RouHim/binvec/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('520a106f07810c03e51f35eaccc517a86ae045ad326a2100af49e26232926cb0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
