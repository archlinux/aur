# Maintainer: MotherSphere <mothersphere.colony@gmail.com>
pkgname=colony-bin
_pkgname=colony
pkgver=0.7.0
pkgrel=1
pkgdesc="Application launcher for the Project-Colony ecosystem (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Project-Colony/Colony"
license=('MIT')
depends=(
    'gcc-libs'
    'openssl'
    'xz'
    'gtk3'
    'xdotool'
    'dbus'
    'vulkan-icd-loader'
)
provides=('colony')
conflicts=('colony' 'colony-git')
source=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/colony-linux")
noextract=("${_pkgname}-${pkgver}")
sha256sums=('a5545dfbe49256e90114eec42cf9184f4a0fc0a48d2e997b9eee0e1fc9d8ce61')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop entry so GNOME/KDE/rofi/wofi launchers pick up Colony.
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/colony.desktop" <<'EOF'
[Desktop Entry]
Name=Colony
GenericName=Application Launcher
Comment=Application launcher for the Project-Colony ecosystem
Exec=colony
Icon=colony
Terminal=false
Type=Application
Categories=Utility;System;
Keywords=launcher;apps;project-colony;
StartupNotify=true
EOF
}
