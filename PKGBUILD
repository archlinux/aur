# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi(Canmi21)

pkgname=hyprlight
pkgver=1.0.0
pkgrel=1
pkgdesc="Brightness control utility for Hyprland"
arch=('x86_64')
url="https://github.com/canmi21/hyprlight"
license=('MIT')
depends=('glibc' 'brightnessctl')
makedepends=('cargo')

source=("git+https://github.com/canmi21/hyprlight.git#branch=master" 
        "https://raw.githubusercontent.com/canmi21/hyprlight/master/LICENSE")

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  mv hyprlight hyprlight-$pkgver
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/hyprlight "$pkgdir/usr/bin/hyprlight"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
