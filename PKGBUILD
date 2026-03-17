# Maintainer: Eldin Beganovic <eldinbegano@gmail.com>
# Contributor: Franklyn Team <franklyn@htl-leonding.ac.at>

pkgname=franklyn-bin-dev
_pkgname=franklyn-sentinel
pkgver=0.5.0.dev.1
_pkgver_orig=0.5.0+dev.1
pkgrel=1
pkgdesc="Screen monitoring client for Franklyn (development channel) - streams student screen activity to teacher dashboard during exams"
arch=('x86_64' 'aarch64')
url="https://github.com/2526-4ahitm-itp/2526-4ahitm-franklyn"
license=('MIT')
depends=('openssl' 'libxcb' 'pipewire' 'wayland' 'libglvnd' 'mesa' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libxinerama' 'libxext' 'libxrender' 'libxxf86vm')
provides=('franklyn' 'franklyn-sentinel')
conflicts=('franklyn' 'franklyn-sentinel' 'franklyn-bin')
options=('!strip')

_base_url="https://github.com/2526-4ahitm-itp/2526-4ahitm-franklyn/releases/download"

source_x86_64=("${_pkgname}-${pkgver}-x86_64::${_base_url}/v${_pkgver_orig}/${_pkgname}-${_pkgver_orig}-x86_64-linux"
               "franklyn-sentinel.desktop"
               "LICENSE::https://raw.githubusercontent.com/2526-4ahitm-itp/2526-4ahitm-franklyn/main/LICENSE")

source_aarch64=("${_pkgname}-${pkgver}-aarch64::${_base_url}/v${_pkgver_orig}/${_pkgname}-${_pkgver_orig}-aarch64-linux"
                "franklyn-sentinel.desktop"
                "LICENSE::https://raw.githubusercontent.com/2526-4ahitm-itp/2526-4ahitm-franklyn/main/LICENSE")

sha256sums_x86_64=('c9d23c99a5ba58fe2442cc6024c3803c94bfd36f379f56819c1b65acb50718e4'
                   'SKIP'
                   'SKIP')
sha256sums_aarch64=('1215b0b0455b9792ed96d6be695dc2d7d6e9ff1e02db5e7a9fe94edf39e0ede1'
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
