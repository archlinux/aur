# Maintainer: sojiroh <tu-email@example.com>
pkgname=starfox64recomp-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Static recompilation of Star Fox 64 for PC using N64Recomp and RT64"
arch=('x86_64')
url="https://github.com/sonicdcer/Starfox64Recomp"
license=('GPL-3.0-only')
depends=(
    'sdl2'
    'gtk3'
    'libsm'
    'libice'
    'vulkan-icd-loader'
)
optdepends=(
    'vulkan-radeon: Vulkan support for AMD GPUs'
    'vulkan-intel: Vulkan support for Intel GPUs'
    'nvidia-utils: Vulkan support for NVIDIA GPUs'
)
provides=('starfox64recomp')
conflicts=('starfox64recomp' 'starfox64recomp-git')
options=(!strip)
source=(
    "${pkgname}-${pkgver}.zip::https://github.com/sonicdcer/Starfox64Recomp/releases/download/${pkgver}/Starfox64Recompiled-v${pkgver}-Linux-X64-Release.zip"
    "starfox64recomp.desktop"
    "starfox64recomp.sh"
)
sha256sums=('e74932bd0edb6186a015dabaa87b6b24af3d3b5511ff3b0293a2c3331840cdf0'
            '7bd8e83980ecd390b401fcf2937c09ea4eedd96c1b4b02002912bce96bbeada9'
            'e11f95775f54e8f64339ba05ba3f9841c51b2bf6ce95585e9794b1202a9574b1')

prepare() {
    cd "${srcdir}"
    tar -xzf Starfox64Recompiled.tar.gz
}

package() {
    install -dm755 "${pkgdir}/opt/starfox64recomp"

    # Ejecutable
    install -Dm755 "${srcdir}/Starfox64Recompiled" "${pkgdir}/opt/starfox64recomp/Starfox64Recompiled"

    # Assets y controller db
    cp -a "${srcdir}/assets" "${pkgdir}/opt/starfox64recomp/"
    install -Dm644 "${srcdir}/recompcontrollerdb.txt" "${pkgdir}/opt/starfox64recomp/recompcontrollerdb.txt"

    # Script wrapper en /usr/bin
    install -Dm755 "${srcdir}/starfox64recomp.sh" "${pkgdir}/usr/bin/starfox64recomp"

    # .desktop file
    install -Dm644 "${srcdir}/starfox64recomp.desktop" \
        "${pkgdir}/usr/share/applications/starfox64recomp.desktop"
}
