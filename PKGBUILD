# Maintainer: Grzegorz Baranski <root@gbaranski.com>

_pkgname=houseflow
pkgname="${_pkgname}-git"
pkgver=0.5.0
pkgrel=2
pkgdesc="Home automation platform, written in Rust"
arch=(
    'x86_64'
    'arm'
    'armv6h'
    'armv7h'
    'aarch64'
    'i686'
)
url="https://github.com/gbaranski/houseflow"
license=('GPL-3.0')
makedepends=(
    'git'
    'rust'
    'cargo'
)
source=("${_pkgname}::git+https://github.com/gbaranski/houseflow")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked
}

check() {
    cd "${_pkgname}"
    cargo test --release --workspace --locked
}

prepare() {
    cd "${_pkgname}"
    cargo fetch --locked
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
