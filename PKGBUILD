# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=flowsurface
pkgver=0.9.0
pkgrel=1
pkgdesc="A native desktop charting platform for crypto markets"
arch=('x86_64')
url="https://github.com/flowsurface-rs/flowsurface"
license=('GPL-3.0-or-later')
depends=('libxkbcommon-x11')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'flowsurface.desktop')
b2sums=('1bdd2aa5c398a23b4ce3e9f77aa4c8523ca98188b40cffd7c9be66b6289c4332bb1cc9413e50f611228165ba69620d802f28eada4b756a9a8d4e47cb8c4b0443'
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
