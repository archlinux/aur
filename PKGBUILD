# Maintainer: Noam Lewis
#
# Binary package - downloads prebuilt binary from GitHub releases

pkgname=fresh-editor-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
url="https://sinelaw.github.io/fresh/"
license=("GPL-2.0-only")
arch=('x86_64' 'aarch64')

source_x86_64=("fresh-editor-0.2.1-x86_64.tar.xz::https://github.com/sinelaw/fresh/releases/download/v0.2.1/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
             "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")
source_aarch64=("fresh-editor-0.2.1-aarch64.tar.xz::https://github.com/sinelaw/fresh/releases/download/v0.2.1/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
               "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")

sha256sums_x86_64=("ceb9cbdba957f710b1d2a52f98102dc90318af3544968b90f6573681bdc485e8"
                  "SKIP")
sha256sums_aarch64=("39705cccb1e6105ba41172820feb49514cf3a40467dd3ee5efc0a82c02ca9e6c"
                   "SKIP")














depends=("gcc-libs" "glibc")
provides=("fresh-editor")
conflicts=("fresh-editor")
options=('!debug')

package() {
    cd "fresh-editor-$CARCH-unknown-linux-gnu"

    # Binary (installed alongside plugins, symlinked from /usr/bin)
    install -Dm755 fresh "$pkgdir/usr/share/fresh-editor/fresh"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/fresh-editor/fresh" "$pkgdir/usr/bin/fresh"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/fresh-editor/README.md"

    # License
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Plugins
    cp -r plugins "$pkgdir/usr/share/fresh-editor/"
}
