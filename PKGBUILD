pkgname=bin-cpuflags-x86
pkgver=1.0.10
pkgrel=1
pkgdesc='A small CLI tool to detect CPU flags (instruction sets) of X86 binaries'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')

depends=('glibc' 'libgcc')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${url}/archive/${pkgver}/${_snapshot}.tar.gz")
sha256sums=('1222619740fbb52cc87ff91a22f2a24106181c88bab52e3d780f39eedf7d2001')

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
    install -Dm755 "release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${_snapshot}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
