# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>
pkgname=backuptousb-git
pkgver=0.1.0.alpha.git20260201
pkgrel=1
pkgdesc="Backup your home directory to USB or any folder with optional SSH copy, large file deletion, and logging. GTK4 GUI with dynamic About dialog."
arch=('x86_64')
url="https://github.com/Kuznix/backuptousb"
license=('GPL3')
depends=('gtk4' 'glib2')
makedepends=('rust' 'cargo' 'git')
provides=('backuptousb')
conflicts=('backuptousb')
source=("git+https://github.com/Kuznix/backuptousb.git")
sha256sums=('SKIP')

# Auto-generate pkgver with latest commit date (YYYYMMDD)
pkgver() {
    cd "$srcdir/backuptousb"
    # hyphen version instead of '+' for makepkg compatibility
    echo "0.1.0.alpha.git$(git log -1 --format=%cd --date=format:%Y%m%d)"
}

build() {
    cd "$srcdir/backuptousb"
    cargo add gdk4
    cargo build --release
}

package() {
    cd "$srcdir/backuptousb"

    # Install binary
    install -Dm755 target/release/backuptousb "$pkgdir/usr/bin/backuptousb"

    # Install desktop file
    install -Dm644 extra/linux/backuptousb.desktop "$pkgdir/usr/share/applications/backuptousb.desktop"

    # Install icons
    install -Dm644 extra/logo/backuptousb-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/backuptousb.png"
    install -Dm644 extra/logo/backuptousb-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/backuptousb.png"
    install -Dm644 extra/logo/backuptousb-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/backuptousb.png"
    install -Dm644 extra/logo/backuptousb-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/backuptousb.png"
    install -Dm644 extra/logo/backuptousb-512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/backuptousb.png"
}
