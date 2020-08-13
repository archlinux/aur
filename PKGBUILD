# Maintainer: ifreund <ifreund@ifreund.xyz>

pkgname=waylock
pkgver=0.3.3
pkgrel=1
pkgdesc='A simple screenlocker for wayland compositors.'
arch=('x86_64')
url="https://github.com/ifreund/waylock"
license=('MIT')
depends=('pam')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f0b7377bf743111c82d7292daaa84a0aca861b17608accf18d181ac66fbacfc9')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"

    install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/${pkgname}"
    install -Dm 644 "waylock.toml" -t "$pkgdir/usr/share/doc/${pkgname}"
    install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
