# Maintainer: PeroSar <perosar1111@gmail.com>

pkgname=pero-editor
pkgver=0.1.0
pkgrel=2
pkgdesc="Simple text-editor written in rust"
url=https://pero-editor.perosar.tech
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
source=("https://perosar.tilde.team/$pkgname/$pkgver.tar.gz")
sha256sums=("00fe018e46d3ab5463d7ea5d49aa7bfa86664bfd5fd69014f775f2f7b86ce030")


build() {
    cd "$pkgname-$pkgver"

    cargo build --release
}
package() {
    cd "$pkgname-$pkgver"

    # Final executable
    install -Dm755 target/release/pe "$pkgdir/usr/bin/pe"

    # License file
    install -Dm644 LICENSE "$pkgdir/usr/share/doc/pero-editor/LICENSE"

    # HTML documentation
    cp --recursive docs "$pkgdir/usr/share/doc/pero-editor/html"

    # Symlink
    ln --symbolic --force "$pkgdir/usr/bin/pe" "$pkgdir/usr/bin/pero-editor"
}
