# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=flowsurface
pkgver=0.8.6
pkgrel=1
pkgdesc="A native desktop charting platform for crypto markets"
arch=('x86_64')
url="https://github.com/flowsurface-rs/flowsurface"
license=('GPL-3.0-or-later')
depends=('libxkbcommon-x11')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'flowsurface.desktop')
b2sums=('da932f9f9fe2eb2cd07dca8188c3b0ef1354c2af7e3dbf53cbd8ccdb1a304420c6867bc4f8490c8e094be550e0566c8211843fe7d8d4cdcb8f8ae8c9b76560ff'
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

