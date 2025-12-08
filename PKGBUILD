# Maintainer: bhimio <bhima.work@gmail.com>
# Contributor: Antigravity <antigravity@google.com>
pkgname=materials-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="A modern Material Design 3 File Manager"
arch=('x86_64')
url="https://github.com/bhimio1/material-3-file-explorer"
license=('MIT')
depends=('fuse2' 'gtk3' 'zlib' 'nss')
provides=('materials')
conflicts=('materials')
options=('!strip')
_appimage="Materials-${pkgver}.AppImage"

# Using GitHub Release source
source=("${_appimage}::https://github.com/bhimio1/material-3-file-explorer/releases/download/v${pkgver}/${_appimage}"
        "https://raw.githubusercontent.com/bhimio1/material-3-file-explorer/v${pkgver}/assets/icon.png")
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # Symlink to /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/materials"

    # Create desktop entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Materials
Exec=/opt/${pkgname}/${pkgname}.AppImage
Icon=${pkgname}
Type=Application
Categories=Utility;FileManager;
Comment=A modern Material Design 3 File Manager
Terminal=false
StartupWMClass=Materials
EOF
}
