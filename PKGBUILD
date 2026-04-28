pkgname=aur-check-rebuild
pkgver=1.3.1
pkgrel=1
pkgdesc='Pacman hook to check and launch rebuild of AUR packages affected by updates'
arch=('x86_64')
url='https://github.com/Emiliopg91/aur-check-rebuild'
license=('GPL-2')
depends=(
  'alacritty'
  'pacman'
)
makedepends=(
  rust
)
source=(
  "git+$url.git#tag=$pkgver-$pkgrel"
)
sha256sums=(
  'SKIP'
)
install=${pkgname}.install

build() {
  cd "$srcdir/aur-check-rebuild"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/aur-check-rebuild/target/release/aur-check-rebuild" "$pkgdir/usr/share/libalpm/scripts/aur-check-rebuild"
  install -Dm644 "$srcdir/aur-check-rebuild/hooks/zz-aur-check-rebuild.hook" "$pkgdir/usr/share/libalpm/hooks/zz-aur-check-rebuild.hook"
}