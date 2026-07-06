pkgname=waveloggate-git
pkgdesc="CAT and WSJT-X Bridge for WaveLog"
pkgver=2.0.8
pkgrel=1
arch=('x86_64')
makedepends=(
    'git'
)
depends=(
    'go'
    'wails'
    'bun'
    'webkit2gtk-4.1'
    'hamlib'
)
provides=('waveloggate')
conflicts=('waveloggate' 'waveloggate-bin')
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
sha256sums=('0185611e3be05fc084153eff3a3415219acf1052009e03227c149e66db02d8d6'
            '1f42c3eedc034ef363388224d05284b686ba94769650e1a2359f304c849197cb'
            '593e1c6e902130d0c911e34f5d26f1e4d2703327b814c94ae82be04e1c2d80bb'
            'aa5da810c4c84cbde4b79445e2fb1195c61d4f9b5c85eafa4bc2867b3d16a39d')


options=(!lto !debug)
# not needed - javascript

build () {
    cd WaveLogGate
    wails build -clean -tags webkit2_41
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
