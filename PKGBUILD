pkgname=augenblick-bin
pkgver=0.6.3
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

sha256sums_x86_64=("ce4d955a47fdb6fe0dec631a171987afb825f760fb82ba4e749e427d5e7080ba")
sha256sums_aarch64=("5c2e6482fa0207d17c50e170c4120af4db9aa989b87c0bcb2f61fd518bada2e8")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "augenblick-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "augenblick-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "augenblick" "$pkgdir/usr/bin/augenblick"
  install -Dm644 "augenblick-$pkgver-augenblick.service" "$pkgdir/usr/lib/systemd/user/augenblick.service"
}
