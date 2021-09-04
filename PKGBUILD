# Maintainer: Autumnal <friedrich122112 At me DOT com>

pkgname=rust-df-git
_pkgname=rust-df
pkgver=r39.d49914d
pkgrel=1
pkgdesc="Simple df like utility in Rust"
arch=('x86_64' 'i686')
url="https://github.com/mfs/rust-df"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
provides=('rdf')
conflicts=()
source=("git://github.com/mfs/rust-df/#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd  "${srcdir}/${_pkgname}"
    cargo build --release --target-dir "./target"
}

package() {
    cd "${srcdir}/${_pkgname}"

    # Install binary.
    install -Dm 755 "target/release/rdf" "${pkgdir}/usr/bin/rdf"

    # Install MIT license
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/rdf/LICENSE-MIT"
}
