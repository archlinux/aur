# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=zenus
pkgver=0.2.4
pkgrel=1
pkgdesc="A beautiful note-taking app built with Tauri with Local, Server and Client mode"
arch=('x86_64')
url="https://github.com/skorotkiewicz/zenus"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
# depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
options=(!strip)
source_x86_64=("zenus-${pkgver}-x86_64.deb::https://github.com/skorotkiewicz/zenus/releases/download/app-v${pkgver}/zenus_${pkgver}_amd64.deb")

sha256sums_x86_64=('SKIP')

package() {
    # Unpacking deb
    msg2 "Unpacking deb package..."
    ar x "${srcdir}/zenus-${pkgver}-x86_64.deb"
    tar xf data.tar.gz

    # Copying application files
    msg2 "Copying application files..."
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share"
    
    # Copy binary
    cp -r "${srcdir}/usr/bin/"* "${pkgdir}/usr/bin/"
    
    # Copy share files (icons, desktop files, etc.)
    if [ -d "${srcdir}/usr/share" ]; then
        cp -r "${srcdir}/usr/share/"* "${pkgdir}/usr/share/"
    fi
    
    # Set permissions
    chmod +x "${pkgdir}/usr/bin/zenus"
}
