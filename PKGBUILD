pkgname=augenblick-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Fullscreen eye-blink overlay for X11 and Wayland (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/augenblick"
license=('MIT')
depends=('glibc' 'libxcb')
provides=('augenblick')
conflicts=('augenblick')

source=("augenblick-$pkgver-augenblick.service::https://raw.githubusercontent.com/x71c9/augenblick/v$pkgver/contrib/augenblick.service")
sha256sums=("a94ae797751377e9e751790ad944b0340f1c87dba0f27ae0cc2310c04f02fca0")

source_x86_64=("augenblick-x86_64-$pkgver.tar.gz::https://github.com/x71c9/augenblick/releases/download/v$pkgver/augenblick-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("augenblick-aarch64-$pkgver.tar.gz::https://github.com/x71c9/augenblick/releases/download/v$pkgver/augenblick-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("d0feead0e89f306e65a774a5fa6dc1dcdcae6643826a3b49085cc9f3010b5f92")
sha256sums_aarch64=("0a91a1223941c73080aa5c2836ac5437eeb68aa443ccde3247098fbbfb7da6a2")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "augenblick-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "augenblick-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "augenblick" "$pkgdir/usr/bin/augenblick"
  install -Dm644 "augenblick-$pkgver-augenblick.service" "$pkgdir/usr/lib/systemd/user/augenblick.service"
}
