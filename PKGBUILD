# Maintainer: Strykar <strykar@hotmail.com>

_pkgname=rsntp
pkgname=rsntp-git
pkgver=r17.06281a9
pkgrel=2
pkgdesc="An experimental multi-threaded high-performance NTP server in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/mlichvar/rsntp"
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('rust' 'cargo' 'clang' 'cmake' 'git')
source=("git+https://github.com/mlichvar/rsntp.git")
sha256sums=('SKIP') 

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/rsntp" "${pkgdir}/usr/bin/rsntp"
    install -Dm644 README.adoc "${pkgdir}/usr/share/doc/${_pkgname}/README.adoc"
}
