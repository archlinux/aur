# Maintainer: Noam Lewis
#
# Binary package - downloads prebuilt binary from GitHub releases

pkgname=fresh-editor-bin
pkgver=0.1.94
pkgrel=1
pkgdesc="A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
url="https://sinelaw.github.io/fresh/"
license=("GPL-2.0-only")
arch=('x86_64' 'aarch64')

source_x86_64=("https://github.com/sinelaw/fresh/releases/download/v0.1.94/fresh-editor-x86_64-unknown-linux-gnu.tar.xz"
             "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")
source_aarch64=("https://github.com/sinelaw/fresh/releases/download/v0.1.94/fresh-editor-aarch64-unknown-linux-gnu.tar.xz"
               "https://raw.githubusercontent.com/sinelaw/fresh/master/LICENSE")

sha256sums_x86_64=("0cd93770206788a2406f4ff83ffca71405f61a1abaf31af30ab795ce3dff0830"
                  "SKIP")
sha256sums_aarch64=("e313f833d1f4589b8bc9c0db5c9ec15981ad7944cf6b59df44207e60bc02030f"
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
