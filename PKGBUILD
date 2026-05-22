# Maintainer: secureNqwer
pkgname=zerolink
pkgver=1.1.0
pkgrel=1
pkgdesc="Secure P2P Messenger with ZeroTier network"
arch=("x86_64" "aarch64")
url="https://github.com/secureNqwer/messenger-core"
license=("MIT")
depends=("glibc" "gcc-libs" "hicolor-icon-theme")
makedepends=("go" "git" "cmake" "make" "base-devel")
provides=("zerolink")
conflicts=("zerolink-bin")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
  cd "$srcdir/messenger-core-$pkgver"
  bash scripts/build_libzt.sh
  make client
  make server
}

package() {
  cd "$srcdir/messenger-core-$pkgver"
  install -Dm755 bin/zerolink "$pkgdir/usr/bin/zerolink"
  install -Dm755 bin/zerolink-server "$pkgdir/usr/bin/zerolink-server"
  install -Dm644 icons/zerolink.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/zerolink.png"
  install -Dm644 zerolink.desktop.in "$pkgdir/usr/share/applications/zerolink.desktop"
  sed -i "s|EXEC|/usr/bin/zerolink|g; s|ICON|zerolink|g" "$pkgdir/usr/share/applications/zerolink.desktop"
}
