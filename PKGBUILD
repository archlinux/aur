# Maintainer: RouHim

pkgname=binvec
pkgver=1.20.7
pkgrel=1
pkgdesc="A simple application to convert raster graphics to vector graphics"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/RouHim/binvec"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RouHim/binvec/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('07fc558fe202ed790ecf75644d1e9ce85971fe5714663223324506a4351a8f6a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install desktop file
  install -Dm644 ".desktop/binvec.desktop" "${pkgdir}/usr/share/applications/binvec.desktop"

  # Install icon
  install -Dm644 ".desktop/icon.png" "${pkgdir}/usr/share/pixmaps/binvec.png"
}
