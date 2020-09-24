# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_branch=dev
pkgname=modulo-git
pkgver=r85.1a6a389
pkgrel=1
pkgdesc="Basic Cross-platform GUI Toolkit for Any Language"
arch=(x86_64)
url="https://github.com/federico-terzi/modulo"
license=("GPL3")
depends=("wxgtk2")
makedepends=("rust" "git" "clang")
provides=(modulo)
conflicts=(modulo)
source=("${pkgname}::git+https://github.com/federico-terzi/modulo.git#branch=${_branch}")
sha512sums=('SKIP')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
    cd "$pkgname"

    cargo test --release # --locked # not available as of 2020/09/24
}

build() {
    cd "$pkgname"

    cargo build --release # --locked # not available as of 2020/09/24
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/modulo" "${pkgdir}/usr/bin/modulo"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/modulo/README.md"
}
