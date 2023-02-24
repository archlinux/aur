# Maintainer: Sven Friedrich <sven AT autumnal DOT de>

pkgname=rust-df-git
_pkgname=rust-df
pkgver=v0.1.0.6.g2da7ca8
pkgrel=1
pkgdesc="Simple df like utility in Rust"
arch=('x86_64' 'i686')
url="https://github.com/mfs/rust-df"
_git="https://github.com/mfs/${_pkgname}.git"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
provides=('rdf')
conflicts=()
source=("${_pkgname}::git+${_git}")
sha256sums=('SKIP')

_bin=rdf

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/-/./g'
}

prepare() {
    cd "${_pkgname}"
    cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
    cd "${_pkgname}"
    cargo build --release --frozen
}

package() {
    cd "${_pkgname}"
    install -Dm 0755 "target/release/${_bin}" "${pkgdir}/usr/bin/${_bin}"
    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
