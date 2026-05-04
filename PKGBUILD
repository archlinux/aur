# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=gitte
pkgname="$_pkgname-git"
pkgver=r274.g023ab14
pkgrel=2
pkgdesc="A GTK4/libadwaita Git client for the GNOME desktop"
arch=(x86_64 aarch64)
url="https://codeberg.org/ckruse/Gitte"
license=('AGPL-3.0-or-later')
depends=(git libgit2 gtk4 libadwaita glib2)
makedepends=(cargo meson ninja)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Gitte"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Gitte"
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson . build --buildtype=release
  meson compile -C build
}

package() {
  cd "$srcdir/Gitte"
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
