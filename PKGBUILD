# Maintainer: Katherine Jamison <axertheaxe@proton.me>

pkgname=desk-exec-git
_pkgname=desk-exec
pkgver=0.2.1.r0.gd6a9967
pkgrel=1
pkgdesc="Execute programs defined in XDG desktop entries directly from the command line"
url="https://github.com/axertheaxe/desk-exec"
source=("git+https://github.com/axertheaxe/desk-exec")
license=("Unlicense")
arch=("x86_64")
provides=("desk-exec")
conflicts=("desk-exec")
makedepends=('cargo')
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --frozen
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "target/release/desk-exec" "$pkgdir/usr/bin/desk-exec"

    install -Dm644 "target/release/dist/desk-exec.bash" "$pkgdir/usr/share/bash-completion/completions/desk-exec"
    install -Dm644 "target/release/dist/_desk-exec" "$pkgdir/usr/share/zsh/site-functions/_desk-exec"
    install -Dm644 "target/release/dist/desk-exec.fish" "$pkgdir/usr/share/fish/vendor_completions.d/desk-exec.fish"
    install -Dm644 "target/release/dist/desk-exec.nu" "$pkgdir/usr/share/nu-completion/desk-exec.nu"
    install -Dm644 "target/release/dist/desk-exec.elv" "$pkgdir/usr/share/elvish/modules/completion/desk-exec.elv"

    install -Dm644 "target/release/dist/desk-exec.1" "$pkgdir/usr/share/man/man1/desk-exec.1"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
