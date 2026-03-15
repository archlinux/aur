# Maintainer: Jakob Edlbacher <j.edlbacher@students.htl-leonding.ac.at>
# Contributor: Franklyn Team <franklyn@htl-leonding.ac.at>

pkgname=franklyn-bin
_pkgname=franklyn-sentinel
pkgver=0.4.0
pkgrel=1
pkgdesc="Screen monitoring client for Franklyn - streams student screen activity to teacher dashboard during exams"
arch=('x86_64' 'aarch64')
url="https://github.com/2324-4bhif-syp/2324-4bhif-syp-project-franklyn"
license=('MIT')
depends=('openssl' 'libxcb' 'pipewire' 'wayland' 'libglvnd' 'libgbm' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libxinerama' 'libxext' 'libxrender' 'libxxf86vm')
provides=('franklyn' 'franklyn-sentinel')
conflicts=('franklyn' 'franklyn-sentinel' 'franklyn-bin-dev')
options=('!strip')

_base_url="https://github.com/2324-4bhif-syp/2324-4bhif-syp-project-franklyn/releases/download"

source_x86_64=("${_pkgname}-${pkgver}-x86_64::${_base_url}/v${pkgver}/${_pkgname}-${pkgver}-x86_64-linux"
               "franklyn-sentinel.desktop"
               "LICENSE::https://raw.githubusercontent.com/2324-4bhif-syp/2324-4bhif-syp-project-franklyn/main/LICENSE")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${_base_url}/v${pkgver}/${_pkgname}-${pkgver}-aarch64-linux"
                "franklyn-sentinel.desktop"
                "LICENSE::https://raw.githubusercontent.com/2324-4bhif-syp/2324-4bhif-syp-project-franklyn/main/LICENSE")

sha256sums_x86_64=('SKIP'
                   'SKIP'
                   'SKIP')
sha256sums_aarch64=('SKIP'
                    'SKIP'
                    'SKIP')

package() {
    # Install binary
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/franklyn"

    # Install desktop entry
    install -Dm644 "${srcdir}/franklyn-sentinel.desktop" "${pkgdir}/usr/share/applications/franklyn-sentinel.desktop"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install icons (fetched from repo in CI, or use placeholder)
    for size in 16 24 32 48 64 128 256 512; do
        if [[ -f "${srcdir}/icons/${size}x${size}/apps/franklyn-sentinel.png" ]]; then
            install -Dm644 "${srcdir}/icons/${size}x${size}/apps/franklyn-sentinel.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/franklyn-sentinel.png"
        fi
    done
}
