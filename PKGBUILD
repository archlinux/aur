# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=vibe-bin
pkgver=3.1.6
pkgrel=1
pkgdesc="Transcribe audio / video offline using OpenAI Whisper"
arch=('x86_64')
url="https://thewh1teagle.github.io/vibe/"
license=('MIT')
depends=('ffmpeg' 'openblas' 'vulkan-icd-loader' 'webkit2gtk-4.1' 'gtk3' 'xdotool')
makedepends=('patchelf')
options=('!debug')

source=(
    "https://github.com/thewh1teagle/vibe/releases/download/v${pkgver}/vibe_${pkgver}_amd64.deb"
    "LICENSE-MIT::https://raw.githubusercontent.com/thewh1teagle/vibe/main/LICENSE"
)
sha256sums=('3b4284b55c03a5539101dc4ad8dd53971ceb391c509fbb0e7867bfbd460ffbe6'
            '30d26b5b70187611accccc4afddb8eb13ee32d85cdc85b4f77103b86a2dfc056')

package() {
    tar -xf data.tar.* -C "${srcdir}"

    install -Dm644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/usr/share/applications/vibe.desktop" \
        "${pkgdir}/usr/share/applications/vibe.desktop"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/vibe.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vibe.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256@2/apps/vibe.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/vibe.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/vibe.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/vibe.png"

    install -Dm755 "${srcdir}/usr/bin/vibe" \
        "${pkgdir}/usr/bin/vibe"
    install -Dm755 "${srcdir}/usr/bin/sona" \
        "${pkgdir}/usr/bin/sona"

    patchelf --replace-needed libxdo.so.3 libxdo.so \
        "${pkgdir}/usr/bin/vibe"
}
