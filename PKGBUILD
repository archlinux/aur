# Maintainer: Larry Oates <leafman12345@gmail.com>
pkgname=doomfire-wallpaper
pkgver=1.1.0
pkgrel=3
pkgdesc="DOOM-style animated fire wallpaper for Hyprland using hyprwinwrap"
arch=('x86_64')
url="https://github.com/larry-oates/doom_fire_wallpaper"
license=('0BSD')
depends=()
makedepends=('git' 'cargo')
optdepends=('grim: for the screen_burn feature')
source=("$pkgname::git+https://github.com/larry-oates/doom_fire_wallpaper.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --frozen
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/doomfire-wallpaper" "$pkgdir/usr/bin/doomfire-wallpaper"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/doomfire-wallpaper/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
