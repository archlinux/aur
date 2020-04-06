# Maintainer: ifreund <ifreund@ifreund.xyz>

pkgname=waylock
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple screenlocker for wayland compositors.'
arch=('x86_64')
url="https://github.com/ifreund/${pkgname}"
license=('MIT')
depends=('cairo' 'wayland')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('847a0febd1c0595a5b2f2c8a29ec339ca16c649769a11651b8fa66e2e231d070')

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
