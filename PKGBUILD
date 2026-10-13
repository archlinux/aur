# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=flowsurface
pkgver=0.8.10
pkgrel=1
pkgdesc="A native desktop charting platform for crypto markets"
arch=('x86_64')
url="https://github.com/flowsurface-rs/flowsurface"
license=('GPL-3.0-or-later')
depends=('libxkbcommon-x11')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'flowsurface.desktop')
b2sums=('c86d93821bd0dad5cb1f8fc13fc77b4cc6d9d4e6887355e4fbc538dd14f688e75c12479d642a5d33483641f702797a102895917dad2ad8c7521105eb662d1d30'
        'b91515e242fd17052d82ed136861dcd9ccadca1314157123a7b2e31fbcf2a58864b271cb5068b83832278b18c30d550329924050f674f39e1d6687a8431062c8')
options=('!lto')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --locked --release
}

package() {
    install -Dm644 flowsurface.desktop "${pkgdir}/usr/share/applications/flowsurface.desktop"
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
