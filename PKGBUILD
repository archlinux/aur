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
sha256sums=('96fae6531cb43e175291e78396778bd81cd13cdb1ae73260f6bf202fd56dd25b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install desktop file
  install -Dm644 ".desktop/binvec.desktop" "$pkgdir/usr/share/applications/binvec.desktop"

  # Install icon
  install -Dm644 "icon.png" "$pkgdir/usr/share/pixmaps/binvec.png"
}
