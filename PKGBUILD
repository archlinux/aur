pkgname=augenblick-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Fullscreen eye-blink overlay for X11 and Wayland (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/augenblick"
license=('MIT')
depends=('glibc')
provides=('augenblick')
conflicts=('augenblick')

source=("augenblick-$pkgver-augenblick.service::https://raw.githubusercontent.com/x71c9/augenblick/v$pkgver/contrib/augenblick.service")
sha256sums=("a94ae797751377e9e751790ad944b0340f1c87dba0f27ae0cc2310c04f02fca0")

source_x86_64=("augenblick-x86_64-$pkgver.tar.gz::https://github.com/x71c9/augenblick/releases/download/v$pkgver/augenblick-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("augenblick-aarch64-$pkgver.tar.gz::https://github.com/x71c9/augenblick/releases/download/v$pkgver/augenblick-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("e57919fadb2798d93fb3e828bc507c2af8a7147d9b3af3763b7710b3f9fc9711")
sha256sums_aarch64=("b78580cc9da11e728e948a2a09235e3061b9d7db5aa0e6fa770d32e44072c898")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "augenblick-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "augenblick-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "augenblick" "$pkgdir/usr/bin/augenblick"
  install -Dm644 "augenblick-$pkgver-augenblick.service" "$pkgdir/usr/lib/systemd/user/augenblick.service"
}
