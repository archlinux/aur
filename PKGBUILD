# Maintainer: Chris Watson <cawatson1993@gmail.com>

pkgname=windsurf
pkgver=1.0.4
pkgrel=1
pkgdesc="Tomorrow's Editor, Today. Built to keep you in flow state with instant, invaluable AI developer assistance."
arch=('x86_64')
url="https://codeium.com"
license=('custom')
depends=(
    'alsa-lib'
    'dbus'
    'expat'
    'gcc-libs'
    'glibc'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'gtk3'
    'xdg-utils'
)
optdepends=('vulkan-icd-loader: Vulkan support')
provides=('windsurf')
options=(!strip)

source=("https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${pkgver}.deb")
sha256sums=('SKIP')

package() {
    # Extract package data
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    # Fix permissions
    chmod 4755 "${pkgdir}/usr/share/windsurf/chrome-sandbox"

    # Create symlink in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/share/windsurf/windsurf "${pkgdir}/usr/bin/windsurf"
    
    # Add desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat <<EOF >"${pkgdir}/usr/share/applications/windsurf.desktop"
[Desktop Entry]
Name=Windsurf
Comment=Tomorrow's Editor, Today
Exec=/usr/bin/windsurf
Icon=/usr/share/windsurf/resources/app/resources/linux/code.png
Terminal=false
Type=Application
Categories=Development;IDE;
EOF
}
