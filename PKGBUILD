# Maintainer: mizorewww <mizorewww@users.noreply.github.com>
# Generated from course2md/packaging/aur/PKGBUILD-gui.template on release.
pkgname=course2md-gui-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='Native desktop app to turn course videos into illustrated notes'
arch=(x86_64)
url='https://github.com/mizorewww/course2md'
license=('MIT' 'Apache-2.0')
depends=(glibc gcc-libs libxcb libxkbcommon libxkbcommon-x11
         fontconfig libx11 wayland vulkan-icd-loader ffmpeg yt-dlp)
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
sha256sums=('51c34fbb8c661eeaf2d3e130998162dec3e5f571b09fe406fa64c56f52e1d9c5')

package() {
    cd "${srcdir}/course2md-desktop-linux-x86_64"
    # Keep the tested engine beside the GUI, without owning /usr/bin/course2md.
    install -Dm755 course2md-desktop "${pkgdir}/usr/lib/course2md-desktop/course2md-desktop"
    install -Dm755 course2md "${pkgdir}/usr/lib/course2md-desktop/course2md"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../lib/course2md-desktop/course2md-desktop "${pkgdir}/usr/bin/course2md-desktop"
    install -Dm644 course2md.desktop "${pkgdir}/usr/share/applications/course2md.desktop"
    install -Dm644 course2md.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/course2md.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE-material-icons "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-material-icons"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
