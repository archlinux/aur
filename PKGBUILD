pkgname=waveloggate-git
pkgdesc="CAT-Bridge for WSJT-* and FLRig to Wavelog"
pkgver=1.1.11
pkgrel=0
arch=('x86_64')
makedepends=(
    'git'
    'npm'
)
depends=(
    'electron'
    'nodejs'
)
url="https://github.com/wavelog/WaveLogGate"
license=('MIT')
# graphic license: MIT
# source graphic: https://www.wavelog.org/wp-content/uploads/2024/04/wavelog_icon_only.png
source=(
    "WaveLogGate::git+https://github.com/wavelog/WaveLogGate#tag=v$pkgver"
    "WaveLogGate.sh"
    "WaveLogGate.desktop"
    "wavelog_icon_only.png"
)
sha256sums=('SKIP'
            'ac05b6e3429c8b81b8ea3963da90581c305cbf6550188f13e5cfd11b09b91632'
            '593e1c6e902130d0c911e34f5d26f1e4d2703327b814c94ae82be04e1c2d80bb'
            'aa5da810c4c84cbde4b79445e2fb1195c61d4f9b5c85eafa4bc2867b3d16a39d')


options=(!lto !debug)
# not needed - javascript

build () {

    cd WaveLogGate
    npm install --omit=dev --no-fund
}

package() {
    mkdir -p "${pkgdir}/opt/WaveLogGate"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mkdir -p "${pkgdir}/usr/share/applications/"
    cp -r WaveLogGate "${pkgdir}/opt"
    rm -rf "${pkgdir}/opt/WaveLogGate/.git" "${pkgdir}/opt/WaveLogGate/.github" 
    mkdir -p "${pkgdir}/usr/bin/"
    install -m755 -Dt "${pkgdir}/usr/bin" "${srcdir}/WaveLogGate.sh"
    install -m644 -Dt "${pkgdir}/usr/share/applications" "${srcdir}/WaveLogGate.desktop"
    install -m644 -Dt "${pkgdir}/usr/share/pixmaps" "${srcdir}/wavelog_icon_only.png"
}
