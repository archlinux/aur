# Maintainer: Meow King <mr.ziqiyang@gmail.com>
_pkgname=emacs-lsp-booster
pkgname=emacs-lsp-booster-git
pkgver=0.1.1 # NOTE
pkgrel=1 # NOTE
pkgdesc="Emacs LSP performance booster "
arch=("x86_64")
url="https://github.com/blahgeek/emacs-lsp-booster"
license=('MIT') # currently no license available, previous it is BSD 3-Clause
makedepends=(
    "libarchive" # bsdtar
)
depends=()
makedepends=('cargo')
conflicts=($_pkgname)
changelog="changelog.txt" # NOTE
source=("git+https://github.com/blahgeek/emacs-lsp-booster")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --locked
}

package() {
    install -Dm755 "$srcdir/$_pkgname/target/release/emacs-lsp-booster" "${pkgdir}/usr/bin/$_pkgname"
}
