# Maintainer: RouHim

pkgname=binvec
pkgver=1.20.18
pkgrel=1
pkgdesc="A simple application to convert raster graphics to vector graphics"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/RouHim/binvec"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RouHim/binvec/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('affd47848c648ed58fa1a11c97d9797c78a9a1c953a201c55a179c481e75f255')

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
