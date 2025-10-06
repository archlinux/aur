# Maintainer: Sergey Desyatkov <sergeidesyatkov@gmail.com>

pkgname=hydock
pkgver=1.6.0
pkgrel=1
pkgdesc="Hydock is a Rust + GTK dock that uses Hyprland IPC"
arch=('x86_64')
url="https://github.com/desyatkoff/hydock"
license=('GPL-3.0-or-later')
depends=('gtk4-layer-shell' 'cairo' 'gdk-pixbuf2' 'pango' 'glib2' 'glibc' 'gcc-libs' 'gtk4')
makedepends=('rust')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d818a5d787710d0b2ea1a06a2f4db7d73eeefb1b1a33ddefa94fe81275fb4e5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
