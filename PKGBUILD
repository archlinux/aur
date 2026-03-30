# Maintainer: Tenchirox <tenchirox@github.com>
pkgname=all4laser-bin
pkgver=0.1.0
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
sha256sums_x86_64=('c1966d67dfc6d278a83ad233b7e54d8ce84bea0f8db2b514599792ab0f1845a9')
sha256sums_aarch64=('9f5db1fac7f54923b019ffcd3189559cd639d70cbd1be97e7751d1953e050185')

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
