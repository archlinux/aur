# Maintainer: Larry Oates <leafman12345@gmail.com>
pkgname=doomfire-wallpaper
pkgver=r32.g229be49
pkgrel=2
pkgdesc="DOOM-style animated fire wallpaper for Hyprland using hyprwinwrap"
arch=('x86_64')
url="https://github.com/Leafmun-certii/doom_fire_wallpaper"
license=('0BSD')
depends=()
makedepends=('git' 'cargo')
optdepends=('grim: for the screen_burn feature')
source=("$pkgname::git+https://github.com/Leafmun-certii/doom_fire_wallpaper.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked --bin doom-fire-wallpaper
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/doom-fire-wallpaper" "$pkgdir/usr/bin/doom-fire-wallpaper"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/doomfire-wallpaper/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
