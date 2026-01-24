# Maintainer: Ahmet Yildirim <ahmet@example.com>
pkgname=md-viewer-git
pkgver=0.1.0.r95.gbe6347e
pkgrel=1
pkgdesc="Fast, lightweight markdown viewer for Linux with tabs, file explorer, and syntax highlighting"
arch=('x86_64')
url="https://github.com/aydiler/md-viewer"
license=('MIT')
depends=('gcc-libs' 'gtk3' 'libxcb' 'libxkbcommon')
makedepends=('rust' 'cargo' 'git' 'clang' 'pkg-config' 'cmake')
provides=('md-viewer')
conflicts=('md-viewer')
source=("git+https://github.com/aydiler/md-viewer.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/md-viewer"
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd md-viewer
    # Unset makepkg flags that can interfere with Rust/mimalloc build
    unset CFLAGS CXXFLAGS LDFLAGS
    cargo build --release
}

package() {
    cd md-viewer
    install -Dm755 "target/release/md-viewer" "$pkgdir/usr/bin/md-viewer"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
