# Maintainer: Corey Mwamba <contact dot me at coreymwamba dot co dot uk>
pkgname=waybar-niri-taskbar
pkgver=0.4.0+niri.25.11
_pkgname="${pkgname/waybar-/}-${pkgver/+/-}"
pkgrel=1
pkgdesc="A simple taskbar for Niri, written in Rust: release version"
arch=('x86_64')
url="https://github.com/lawngnome/niri-taskbar"
license=('MIT')
depends=('niri' 'waybar' 'gtk3')
makedepends=('rust' 'cargo')
conflicts=('waybar-niri-taskbar-git')
source=("https://github.com/LawnGnome/${pkgname/waybar-/}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25306fdce45d492d1f630cc74ada5e53e521b3f58d04ddb50ef1b68a644269e5')
build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "$srcdir/$_pkgname/target/release/libniri_taskbar.so" "$pkgdir/usr/lib/waybar/libniri_taskbar.so"
}
