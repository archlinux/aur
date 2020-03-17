# Maintainer: ifreund <ifreund@ifreund.xyz>

pkgname=waylock
pkgver=0.1.0
pkgrel=1
pkgdesc='A simple screenlocker for wayland compositors.'
arch=('x86_64')
url="https://github.com/ifreund/${pkgname}"
license=('MIT')
depends=('cairo' 'wayland')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('88f05571a7f151693f1b2ebc44c5d9d1a0a29807e2192e92f69efe9584562274')

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

    install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
