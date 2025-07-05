# Maintainer: jaskir

pkgname=wayle-git
_pkgname=wayle
pkgver=r0.g0000000
pkgrel=1
pkgdesc="A highly configurable Wayland panel/bar. (early development)"
arch=('x86_64')
url="https://github.com/Jas-SinghFSU/wayle"
license=('GPL-3.0-only')
depends=('gtk4')
makedepends=('git' 'rust' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

