# Maintainer: Maverick <owsmyf@gmail.com>

pkgname=ai-toolbox-appimage
pkgver=1.1.5
pkgrel=1
pkgdesc="AI Toolbox 是一个跨平台桌面应用，旨在帮助开发者高效管理各类 AI 编程助手的配置。"
arch=('x86_64')
url="https://github.com/coulsontl/ai-toolbox"
license=('MIT')
options=(!strip)
depends=('fuse2')
source=(
    "AI.Toolbox_${pkgver}_amd64.AppImage::https://github.com/coulsontl/ai-toolbox/releases/download/v${pkgver}/AI.Toolbox_${pkgver}_amd64.AppImage"
    "ai-toolbox.desktop"
    "ai-toolbox.png"
)
sha256sums=(
    'b09d84f2b177fcb17c62772caecf39327bd32b15e0213b1c8eb3f39731572424'
    'c46aa7b5143e820fbbaafad346a73a951271728c2e3d8c77d656870ac7b05810'
    '3866168546a4b43df7c9024fa72dd5fba4c20c3e4372165bc29b525570e1a9e7'
)

package() {
    # Install the AppImage.
    install -Dm755 \
        "$srcdir/AI.Toolbox_${pkgver}_amd64.AppImage" \
        "$pkgdir/opt/ai-toolbox-appimage/ai-toolbox.AppImage"

        # Wrapper
        install -Dm755 /dev/stdin \
            "$pkgdir/usr/bin/ai-toolbox" <<'EOF'
#!/bin/sh
unset LD_PRELOAD
exec /opt/ai-toolbox-appimage/ai-toolbox.AppImage "$@"
EOF

    # Install the desktop entry.
    install -Dm644 \
        "$srcdir/ai-toolbox.desktop" \
        "$pkgdir/usr/share/applications/ai-toolbox.desktop"

    install -Dm644 \
        "$srcdir/ai-toolbox.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/ai-toolbox.png"
}