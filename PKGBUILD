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
sha256sums=('478ee8abdb279bdead85e21597d298e5c732a4681cb80eef535ba248a9253d3b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "${startdir}/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install desktop file
  install -Dm644 "${startdir}/.desktop/binvec.desktop" "${pkgdir}/usr/share/applications/binvec.desktop"

  # Install icon
  install -Dm644 "${startdir}/.desktop/icon.png" "${pkgdir}/usr/share/pixmaps/binvec.png"
}
