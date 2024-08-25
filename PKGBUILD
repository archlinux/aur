# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=hilex-git
pkgdesc="syntax highlighter"
url="https://causal.agency/bin/hilex.html"
license=("AGPL-3.0-or-later")

pkgver=r2462.c8f0df1
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc" "git" "flex")

source=(
    "$pkgname::git+https://git.causal.agency/src#branch=master"
)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"/bin
    make clean hilex
}

package() {
    cd "$pkgname"/bin
    install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1
    install hilex  "$pkgdir"/usr/bin/
    install -m644 man1/hilex.1 "$pkgdir"/usr/share/man/man1
}
