# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>

pkgname=balatrotui-git
_pkgname=BalatroTUI
pkgver=r81.5b052f7
pkgrel=2
pkgdesc="A TUI clone of Balatro"
url="https://github.com/Passeriform/BalatroTUI"
makedepends=('cargo' 'git')
arch=('i686' 'x86_64')
license=('GPL-3.0')
source=("git+https://github.com/Passeriform/BalatroTUI")
sha256sums=('SKIP')
provides=(balatrotui)
conflicts=(balatrotui)

pkgver() {
    cd "$srcdir"
    printf "r%s.%s" "$(git -C ${_pkgname} rev-list --count HEAD)" "$(git -C ${_pkgname} rev-parse --short HEAD)"
}



build() {
    cd "${srcdir}/${_pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/balatro_tui "$pkgdir/usr/bin/balatrotui"
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
