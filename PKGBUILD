# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi(Canmi21)

pkgname=hypraway
pkgver=1.1.0
pkgrel=1
pkgdesc="Lock screen automatically when you leave."
arch=('x86_64')
url="https://github.com/canmi21/hypraway"
license=('MIT')
depends=('glibc' 'swayidle' 'hyprland' 'hyprlock')
makedepends=('cargo')

source=("git+https://github.com/canmi21/hypraway.git#branch=master" 
        "https://raw.githubusercontent.com/canmi21/hypraway/master/LICENSE")

sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  mv hypraway hypraway-$pkgver
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/etc/systemd/system"
  install -Dm755 target/release/hypraway "$pkgdir/usr/bin/hypraway"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  echo "Hypraway service has been installed."
  echo "To add exec-one in you hyprland.conf"
  echo "Also, you can check the config file:"
  echo "  ~/.config/hypr/hypraway.conf"
}
