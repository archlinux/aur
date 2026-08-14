pkgname=librepods-rust-bin
pkgver=1
pkgrel=1
pkgdesc="AirPods management application for Linux (Rust edition)"
arch=('x86_64')
url="https://github.com/librepods-org/librepods"
license=('AGPL-3.0-or-later')
depends=('bluez' 'dbus' 'libpulse' 'hicolor-icon-theme' 'glibc')
provides=('librepods')
conflicts=('librepods' 'librepods-git' 'librepods-rust-git')

_repo="ImMALWARE/aur-librepods-rust-bin"
source=(
    "librepods-${pkgver}::https://github.com/${_repo}/releases/download/librepods-${pkgver}/librepods"
    "icon.png::https://raw.githubusercontent.com/${_repo}/librepods-${pkgver}/linux-rust/assets/icon.png"
    "LICENSE::https://raw.githubusercontent.com/${_repo}/librepods-${pkgver}/LICENSE"
)
sha256sums=('2cf9b4de280a74940265d902bb8f4429ef8318e5c2f61de1f23abffe575e4591'
            '6785d3943faa390146e641fcca5562862b45d25540b2f3f325d5904045246481'
            '20b067f86de375aae6db0f283ab2e65de24d537733b89bd58432c101259d84cf')

package() {
    install -Dm755 "${srcdir}/librepods-${pkgver}" "${pkgdir}/usr/bin/librepods"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/librepods.png"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/librepods.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/librepods.desktop" <<EOF
[Desktop Entry]
Name=LibrePods
Comment=AirPods management application for Linux
Exec=librepods
Icon=librepods
Terminal=false
Type=Application
Categories=Utility;AudioVideo;
EOF

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
