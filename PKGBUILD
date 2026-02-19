# Maintainer: Your Name <itharmarv@gmail.com>
pkgname=branch-bin # Added -bin suffix as is standard for pre-compiled binaries
pkgver=1.2.0
pkgrel=1
pkgdesc="File tree and code preview desktop application built with Tauri"
arch=('x86_64')
url="https://github.com/butterman28/Dev-Section"
license=('AGPL')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3' 'openssl' 'icu' 'zlib')
provides=('branch')
conflicts=('branch')

# Using the variable directly in source is safer for AUR helpers
source_x86_64=("${pkgname}-${pkgver}::https://github.com/butterman28/Dev-Section/releases/download/v${pkgver}/branch-linux-x86_64")
sha256sums_x86_64=('136300dcc00724e8c5d62b5c5b29cd1b2f2f3e16b26520c6ef0447f428c534d9') # Replace with actual hash for security

package() {
    # Install the binary - note the source renaming to avoid conflicts in srcdir
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/branch"
    
    # Desktop Entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/branch.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Branch
Comment=File tree and code preview tool
Exec=branch
Icon=branch
Terminal=false
Categories=Development;Utility;
Keywords=code;tree;file;preview;tauri;
StartupNotify=true
EOF
}