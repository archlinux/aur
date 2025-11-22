pkgname=bin-cpuflags-x86
pkgver=1.0.5
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')

depends=('glibc' 'gcc-libs')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${url}/archive/${pkgver}/${_snapshot}.tar.gz")
sha256sums=('59dc573c1b6b1ddc348508235addc8f28abccb70abd8789eabd77c109286b9a3')

prepare() {
    cd "${_snapshot}"
    cargo fetch --locked
}

build() {
    cd "${_snapshot}"
    cargo build --frozen --release --target-dir "${srcdir}"
}

check() {
    cd "${_snapshot}"
    cargo test --frozen
}

package() {
    install -Dm0755 "release/${pkgname}" -t "${pkgdir}/usr/bin"
}
