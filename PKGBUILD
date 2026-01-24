pkgname=yufi
pkgver=1.0.1
pkgrel=1
pkgdesc="Lightweight GTK4 Wi-Fi manager"
arch=("x86_64")
url="https://github.com/AtefR/YuFi"
license=("MIT")
depends=("gtk4" "networkmanager")
makedepends=("cargo" "rust" "pkgconf")
source=("$pkgname-$pkgver.tar.gz::https://github.com/AtefR/YuFi/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf6ac2588c594a902d8c0a7eac514c978d04951ecacddca4c0183d44ab6dc346')

build() {
  cd "$srcdir/YuFi-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/YuFi-$pkgver"
  install -Dm755 target/release/yufi "$pkgdir/usr/bin/yufi"
  install -Dm644 packaging/com.yufi.app.desktop "$pkgdir/usr/share/applications/com.yufi.app.desktop"
  install -Dm644 packaging/com.yufi.app.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.yufi.app.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
