pkgname=aur-check-updates
pkgver=1.1.9
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libalpm.so' 'libcurl.so')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${url}/archive/${pkgver}/${_snapshot}.tar.gz")
sha256sums=('96bbf2fa0482902d677008b0aa0029532eadd542196501fac7d1787b333ded57')

prepare() {
    cd "${_snapshot}"
    cargo fetch --locked --target host-tuple
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
