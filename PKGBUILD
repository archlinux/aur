# Maintainer: Sofian Jafar <skjafar@gmail.com>
pkgname=dshub-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Desktop application for monitoring and controlling industrial devices via TCP/UDP"
arch=('x86_64')
url="https://github.com/skjafar/dshub"
license=('MIT')
provides=('dshub')
conflicts=('dshub')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'openssl'
    'libsoup3'
    'xdg-utils'
)
source=(
    "dshub-${pkgver}-linux-x86_64.zip::${url}/releases/download/v${pkgver}/dshub-linux-x86_64.zip"
    "dshub-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '0002fcc95323903f89fedbd99e93543ebcd053494358767fdf6925656087457f'
    '21c6fb3a66d5f7a2785700912ea90dccac683d79a3a5c0eb7256144c32616c04'
)

package() {
    # Binary (from zip, extracted flat into srcdir)
    install -Dm755 "${srcdir}/dshub" \
        "${pkgdir}/usr/bin/dshub"

    cd "${srcdir}/dshub-${pkgver}"

    # Desktop entry (generated inline; bundled separately from the source tarball)
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/dshub.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=DSHub
GenericName=Device Monitor
Comment=Monitor and control industrial devices via TCP/UDP
Icon=dshub
Exec=dshub
Terminal=false
Categories=Development;Electronics;Engineering;
Keywords=device;monitor;embedded;tcp;udp;registers;industrial;
StartupNotify=true
StartupWMClass=dshub
EOF
    chmod 644 "${pkgdir}/usr/share/applications/dshub.desktop"

    # Icons (from source tarball)
    install -Dm644 "src-tauri/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dshub.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dshub.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dshub.png"

}
