# Maintainer: Tenchirox <tenchirox@github.com>
pkgname=all4laser-bin
pkgver=0.1.48
pkgrel=1
pkgdesc="Open-source laser engraver controller built with Rust and egui (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Tenchirox/All4Laser"
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'libxcb'
    'libxkbcommon'
    'libglvnd'
    'mesa'
    'fontconfig'
    'freetype2'
    'systemd-libs'
    'v4l-utils'
    'gtk3'
    'openssl'
)
provides=("all4laser=${pkgver}")
conflicts=('all4laser' 'all4laser-git')
_deb_ver="0.1.0"
source_x86_64=("${pkgname}-${pkgver}-amd64.deb::https://github.com/Tenchirox/All4Laser/releases/download/v${pkgver}/all4laser_${_deb_ver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::https://github.com/Tenchirox/All4Laser/releases/download/v${pkgver}/all4laser_${_deb_ver}_arm64.deb")
sha256sums_x86_64=('056e64ad65d5e720f4c9bcd754a9eaf433903fc167ff36ce335cda7950740d3d')
sha256sums_aarch64=('decb7e911e71b45669420ec51f0e250a1f3b8ca660919f2a223a1deb5a0ee7e9')

package() {
    cd "${srcdir}"

    # Extract data from the .deb
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    # Fix permissions
    chmod 755 "${pkgdir}/usr/bin/all4laser"

    # Install license from upstream repo
    install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
This software is licensed under the GNU General Public License v3.0.
See https://github.com/Tenchirox/All4Laser/blob/main/LICENSE for the full text.
EOF
}
