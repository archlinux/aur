# Maintainer: Abid Omar <contact@omarabid.com>
pkgname=codeinput
pkgver=0.1.0
pkgrel=1
pkgdesc="A powerful CLI tool for parsing, analyzing, and managing CODEOWNERS files"
arch=('x86_64' 'aarch64')
url="https://codeinput.com/cli"
license=('MIT')
depends=('gcc' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/code-input/cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "cli-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "cli-${pkgver}"
    cargo build --release --bin ci
}

package() {
    cd "cli-${pkgver}"
    install -Dm755 "target/release/ci" "${pkgdir}/usr/bin/ci"
}
