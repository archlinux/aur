# Maintainer: Bono Fox <tiny4linux@bono-fox.de>

pkgname=tiny4linux-gui
pkgver=1.4.1
pkgrel=1
pkgdesc="A graphical interface for controlling the OBSBOT Tiny series."
arch=('x86_64')
url="https://github.com/OpenFoxes/Tiny4Linux"
license=('EUPL')
categories=('Utility')
depends=()
makedepends=('rust' 'cargo')
source=("$url/releases/download/v$pkgver/tiny4linux-$pkgver.tar.gz")
sha256sums=('b3bd4b2f79d453aad750c01d7a7a509fe5856163da61dce0611d4f375cb95cbb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm755 "src/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/tiny4linux.png"
  install -Dm755 "src/gui/tiny4linux.desktop" "$pkgdir/usr/share/applications/tiny4linux.desktop"
}