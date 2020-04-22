# Maintainer: ifreund <ifreund@ifreund.xyz>

pkgname=waylock
pkgver=0.3.1
pkgrel=1
pkgdesc='A simple screenlocker for wayland compositors.'
arch=('x86_64')
url="https://github.com/ifreund/${pkgname}"
license=('MIT')
depends=('cairo')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f2cb44764434bc27b58e2255c1896b6c4b6ed83ebde46efc127caa5a19bc5052')

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
