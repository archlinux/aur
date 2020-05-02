# Maintainer: Jesse Luehrs <doy@tozt.net>
pkgname=rbw-git
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo' 'git')
depends=('pinentry')
arch=('i686' 'x86_64')
url="https://git.tozt.net/${pkgname%-*}"
source=(git+https://git.tozt.net/${pkgname%-*})
sha256sums=('SKIP')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

build() {
    cd "${pkgname}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}"
    install -Dm 755 target/release/rbw -t "${pkgdir}/usr/bin"
    install -Dm 755 target/release/rbw-agent -t "${pkgdir}/usr/bin"
}
