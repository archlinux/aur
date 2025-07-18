# Maintainer: Corey Mwamba <contact dot me at coreymwamba dot co dot uk>
pkgname=waybar-niri-taskbar-git
_pkgname=niri-taskbar
pkgver=r33.73db83b
pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}
pkgrel=2
pkgdesc="A simple taskbar for Niri, written in Rust"
arch=('x86_64')
url="https://github.com/lawngnome/niri-taskbar"
license=('MIT')
depends=('niri' 'waybar' 'gtk3')
makedepends=('rust' 'cargo' 'git')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "$srcdir/$_pkgname/target/release/libniri_taskbar.so" "$pkgdir/usr/lib/waybar/libniri_taskbar.so"
}
