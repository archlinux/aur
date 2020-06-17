# Maintainer: ifreund <ifreund@ifreund.xyz>

pkgname=waylock
pkgver=0.3.2
pkgrel=1
pkgdesc='A simple screenlocker for wayland compositors.'
arch=('x86_64')
url="https://github.com/ifreund/${pkgname}"
license=('MIT')
depends=('wayland' 'cairo' 'pam')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ac9531e926794b6a46a2d24afc47942f30e2af1219d2b209f64ab50c9378ac8b')

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
