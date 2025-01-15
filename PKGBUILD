pkgname=vibe-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Transcribe audio / video offline using OpenAI Whisper"
arch=('x86_64')
url="https://thewh1teagle.github.io/vibe/"
license=('MIT')
depends=('ffmpeg' 'openblas' 'vulkan-icd-loader' 'libwebkit2gtk-4.1.so' 'gtk3')
source=("https://github.com/thewh1teagle/vibe/releases/download/v${pkgver}/vibe_${pkgver}_amd64.deb")
sha256sums=('e5633eadabc8c64f8a2fced92695845007a95a4593db58314e1e7c1dbb3e13ee')

package() {
    tar -xf data.tar.* -C "${srcdir}"
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
    chmod -R 755 "${pkgdir}/usr"

    for lang_dir in "${srcdir}/usr/lib/vibe/locales/"*; do
        install -d "${pkgdir}/usr/lib/vibe/locales/$(basename "$lang_dir")"
        install -m644 "$lang_dir"/* "${pkgdir}/usr/lib/vibe/locales/$(basename "$lang_dir")/"
    done
}

