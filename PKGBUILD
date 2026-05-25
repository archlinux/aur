# Maintainer: markbus-ai <markbus-ai@github>
# Contributor: markbus-ai <markbus-ai@github>

pkgname=waybar-switch
pkgver=0.1.0
pkgrel=1
pkgdesc="Graphical waybar profile switcher with quickshell selector"
arch=('x86_64')
url="https://github.com/markbus-ai/waybar-switch"
license=('MIT')
depends=('quickshell' 'waybar' 'imagemagick')
makedepends=('cargo')
source=("https://codeload.github.com/markbus-ai/waybar-switch/tar.gz/v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/waybar-switch "$pkgdir/usr/bin/waybar-switch"
  install -Dm644 quickshell/select-by-image.qml "$pkgdir/usr/share/waybar-switch/select-by-image.qml"
  install -Dm644 quickshell/waybar-switch-selector.service "$pkgdir/usr/lib/systemd/user/waybar-switch-selector.service"
}
