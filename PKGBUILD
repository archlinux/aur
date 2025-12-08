# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=min-bin
pkgver=1.35.2
pkgrel=1
pkgdesc="Min is a fast, minimal browser that protects your privacy."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/minbrowser/min"
license=('Apache')
depends=('gtk3' 'nss' 'libxss')
options=(!strip)
source_aarch64=("min-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/min-${pkgver}-arm64.deb")
source_armv7h=("min-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/min-${pkgver}-armv7l.deb")
source_x86_64=("min-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/min-${pkgver}-amd64.deb")
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_x86_64=('SKIP')

package() {
    # Unpacking deb
    msg2 "Unpacking deb package..."
    ar x "${srcdir}/min-${pkgver}-"*".deb"
    tar xf data.tar.xz
    
    # Copying files
    msg2 "Copying application files..."
    install -dm755 "${pkgdir}/opt"
    cp -r "${srcdir}/opt/Min" "${pkgdir}/opt/"
    
    # Copying desktop shortcut
    msg2 "Copying .desktop file..."
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/applications/min.desktop" "${pkgdir}/usr/share/applications/min.desktop"
    
    # Copying icon
    msg2 "Copying icon..."
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/min.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/min.png"
    
    # Set executable permissions for binary
    chmod +x "${pkgdir}/opt/Min/min"
}