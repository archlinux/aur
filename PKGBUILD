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
sha256sums=('b8d14a800541c968936bb77c5baf5bead9d12b7878de1ed3d30ad7366dcfc932')

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
