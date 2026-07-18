# Maintainer: Linus <jh@orbt.sh>
pkgname=orbit
pkgver=0.1.9
pkgrel=1
pkgdesc="Universal terminal workspace — sessions, panes, and AI agents (alias: orbt)"
arch=('x86_64')
url="https://github.com/linuszz/orbt"
license=('AGPL-3.0-only')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'cmake' 'pkg-config' 'openssl')
provides=('orbit' 'orbt')
conflicts=('orbit-bin' 'orbt' 'orbt-bin')
source=("orbt-${pkgver}.tar.gz::https://github.com/linuszz/orbt/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "orbt-${pkgver}"
    cargo build -p orbt --release --locked
}

package() {
    cd "orbt-${pkgver}"
    install -Dm755 "target/release/orbt" "${pkgdir}/usr/bin/orbt"
    ln -s /usr/bin/orbt "${pkgdir}/usr/bin/orbit"
}
