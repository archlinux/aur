# Maintainer: Carter Jamison <axertheaxe@proton.me>

pkgname=desk-exec
pkgver=0.1.3
pkgrel=1
pkgdesc="Execute programs defined in XDG desktop entries directly from the command line"
url="https://github.com/axertheaxe/desk-exec"
source=("$pkgname-$pkgver.tar.gz::https://github.com/axertheaxe/desk-exec/archive/v$pkgver.tar.gz")
license=("Unlicense")
arch=("x86_64")
provides=("desk-exec")
conflicts=("desk-exec")
makedepends=('cargo')
sha256sums=("f35d649925bf8cae8fb669b3701e5ddc1e9b08249d9a41f89dc0489dc88d5d3e")

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
