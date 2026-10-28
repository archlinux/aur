# Maintainer: mizorewww <mizorewww@users.noreply.github.com>
# Generated from course2md/packaging/aur/PKGBUILD-gui.template on release.
pkgname=course2md-gui-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='Native desktop app to turn course videos into illustrated notes'
arch=(x86_64)
url='https://github.com/mizorewww/course2md'
license=('MIT' 'Apache-2.0')
depends=(glibc gcc-libs libxcb libxkbcommon libxkbcommon-x11
         fontconfig libx11 wayland vulkan-icd-loader ffmpeg yt-dlp aria2)
optdepends=(
    'llama-cpp: local GPU/CPU speech recognition via llama-server'
    'ggml-vulkan: Vulkan GPU speech recognition backend'
    'vulkan-intel: Vulkan graphics driver for Intel GPUs'
    'vulkan-radeon: Vulkan graphics driver for AMD GPUs'
    'nvidia-utils: Vulkan graphics driver for NVIDIA GPUs'
    'vulkan-swrast: software Vulkan renderer when no GPU driver is available'
)
provides=(course2md-gui)
conflicts=(course2md-gui)
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/course2md-desktop-linux-x86_64.tar.gz")
sha256sums=('3e6e929ba233dc63a5657d585f1d6e6a1ee8503f87d06a05d6f278487f5e1f96')

package() {
    cd "${srcdir}/course2md-desktop-linux-x86_64"
    # Keep the tested engine beside the GUI, without owning /usr/bin/course2md.
    install -Dm755 course2md-desktop "${pkgdir}/usr/lib/course2md-desktop/course2md-desktop"
    install -Dm755 course2md "${pkgdir}/usr/lib/course2md-desktop/course2md"
    # The archive's bundled ffmpeg/ffprobe, uv, llama.cpp/ and yt-dlp/ stay
    # out: the package uses Arch's (depends/optdepends), which the engine
    # finds on PATH when none is beside it.
    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../lib/course2md-desktop/course2md-desktop "${pkgdir}/usr/bin/course2md-desktop"
    install -Dm644 course2md.desktop "${pkgdir}/usr/share/applications/course2md.desktop"
    install -Dm644 course2md.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/course2md.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE-material-icons "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-material-icons"
    install -Dm644 LICENSE-lucide-icons "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-lucide-icons"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
