# Maintainer: Carter Jamison <axertheaxe@proton.me>

pkgname=desk-exec
pkgver=0.1.2
pkgrel=1
pkgdesc="Execute programs defined in XDG desktop entries directly from the command line"
url="https://github.com/axertheaxe/desk-exec"
source=("$pkgname-$pkgver.tar.gz::https://github.com/axertheaxe/desk-exec/archive/v$pkgver.tar.gz")
license=("Unlicense")
arch=("x86_64")
provides=("desk-exec")
conflicts=("desk-exec")
makedepends=('cargo')
sha256sums=("c04e6f333f4f8c82f3a545c8c9871aa6641b5c4694f1593706ce0ef4c3189cc4")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "target/release/desk-exec" "$pkgdir/usr/bin/desk-exec"

    install -Dm644 "target/release/dist/desk-exec.bash" "$pkgdir/usr/share/bash-completion/completions/desk-exec"
    install -Dm644 "target/release/dist/_desk-exec" "$pkgdir/usr/share/zsh/site-functions/_desk-exec"
    install -Dm644 "target/release/dist/desk-exec.fish" "$pkgdir/usr/share/fish/vendor_completions.d/desk-exec.fish"
    install -Dm644 "target/release/dist/desk-exec.nu" "$pkgdir/usr/share/nu-completion/desk-exec.nu"
    install -Dm644 "target/release/dist/desk-exec.elv" "$pkgdir/usr/share/elvish/modules/completion/desk-exec.elv"

    install -Dm644 "target/release/dist/desk-exec.1" "$pkgdir/usr/share/man/man1/desk-exec.1"
}
