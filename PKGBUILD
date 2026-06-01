# Maintainer: Megaguy32 <your-email@example.com>
pkgname=lem-editor-webview-ncurses-nightly
pkgrel=1
pkgver=2.2.0.1565.g803e4922f
pkgdesc="An extensible editor written in Common Lisp"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/lem-project/lem"
license=('MIT')
options=("!strip")
depends=('ncurses' 'webkitgtk-6.0')
makedepends=('git' 'sbcl' 'qlot')
conflicts=('lem-editor')
provides=('lem-editor')
source=("lem::git+$url#tag=nightly-latest")
sha256sums=('SKIP')
_variant="webview-ncurses"

pkgver() {
    cd "$srcdir/lem"
    git describe --match "v*" | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/lem"
    qlot install
    make ${_variant}
}

package() {
    cd "$srcdir/lem"
    install -Dm755 lem "$pkgdir/usr/bin/lem"
    install -Dm644 scripts/install/lem.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/lem.svg"
    install -Dm644 resources/lem.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/lem.png"
    install -Dm644 resources/lem.desktop \
        "$pkgdir/usr/share/applications/lem.desktop"
}
