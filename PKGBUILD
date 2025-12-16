# Maintainer: Your Name <your.email@example.com>
pkgname=gleditor
pkgver=1.0.0
pkgrel=2
pkgdesc="A standalone OpenGL ES shader editor with real-time preview and syntax highlighting"
arch=('x86_64')
url="https://github.com/1ay1/gleditor"
license=('MIT')
depends=(
    'gtk3'
    'gtksourceview4'
    'mesa'
    'libglvnd'
)
makedepends=(
    'gcc'
    'make'
    'pkg-config'
)
optdepends=(
    'neowall: Live wallpaper integration for installing shaders directly'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/1ay1/gleditor/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    make PREFIX=/usr DESTDIR="$pkgdir" install

    # Install desktop file
    install -Dm644 data/gleditor.desktop "$pkgdir/usr/share/applications/gleditor.desktop"

    # Install icon
    install -Dm644 data/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gleditor.svg"

    # Install license
    install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/README.md"
}
