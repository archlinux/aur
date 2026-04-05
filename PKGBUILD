pkgname=iopenpod
pkgver=1.0.40
pkgrel=1
pkgdesc="Open source iPod sync tool - manage your iPod without iTunes "
arch=('any')
url="https://github.com/TheRealSavi/iOpenPod"
license=('MIT')
depends=(python)
makedepends=(uv)
optdepends=(
    'ffmpeg: for transcoding support'
    'chromaprint: for acoustic fingerprinting'
)
source=("https://github.com/TheRealSavi/iOpenPod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(532cc208aaae5768aa5e6f024aaede018692ffef038fd73174e0eed1e96c9626)

package() {
    cd "${srcdir}/iOpenPod-${pkgver}"
    uv build
    uv pip install --prefix "${pkgdir}/usr" --no-deps dist/*.whl

    install -Dm644 "assets/icons/icon-256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/iopenpod.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/iopenpod.desktop" << 'EOF'
[Desktop Entry]
Name=iOpenPod
Comment=Open source iPod sync tool
Exec=iopenpod
Icon=iopenpod
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Utility;
EOF
}