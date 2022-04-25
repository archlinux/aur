# Maintainer: Ilya Guterman (amfernusus@gmail.com)

_pkgname='zee'
pkgname="zee-git"
pkgver=r137.1073474
pkgrel=1
pkgdesc="Terminal editor with emacs like kebinds."
arch=('x86_64')
url='https://github.com/zee-editor/zee'
license=('Apache')
sha256sums=('SKIP')
source=("git+https://github.com/zee-editor/${_pkgname}")
provides=('zee')
makedepends=('git' 'rust')
depends=('libgit2' 'libxcb')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --all-features
}

package() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --all-features
    install -D ./target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
