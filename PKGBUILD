# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiori-ebook-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Modern offline-first eBook library manager (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'webkit2gtk'
    'gtk3'
    'libayatana-appindicator'
    'librsvg'
    'speech-dispatcher'
    'sqlite'
    'zstd'
)
provides=('shiori-ebook')
conflicts=('shiori-ebook' 'shiori-ebook-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/shiori-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    # Install the binary
    install -Dm755 "${srcdir}/shiori" "${pkgdir}/usr/bin/shiori"
    
    # Install icons
    install -Dm644 "${srcdir}/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/shiori.png"
    install -Dm644 "${srcdir}/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/shiori.png"
    
    # Create desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/shiori.desktop" <<EOF
[Desktop Entry]
Name=Shiori
GenericName=eBook Library Manager
Comment=Organize, read, and manage your eBook collection
Exec=shiori
Icon=shiori
Type=Application
Categories=Office;Viewer;Education;
Keywords=ebook;reader;library;epub;pdf;mobi;
Terminal=false
StartupNotify=true
MimeType=application/epub+zip;application/pdf;application/x-mobipocket-ebook;application/vnd.amazon.ebook;
EOF
    
    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
