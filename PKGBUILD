# Maintainer: Jas Singh <singh.jaskir@outlook.com>

pkgname=wayle-bin
_pkgname=wayle
pkgver=0.1.0
pkgrel=1
pkgdesc="A configurable desktop shell for Wayland compositors"
arch=('x86_64')
url="https://github.com/wayle-rs/wayle"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'libpulse'
    'fftw'
    'libpipewire'
)
optdepends=(
    'upower: battery module'
    'networkmanager: network module'
    'bluez: bluetooth module'
    'power-profiles-daemon: power profiles module'
    'swww: wallpaper rendering'
    'matugen: Material You color extraction'
    'wallust: color extraction'
    'python-pywal: color extraction'
)

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums_x86_64=('316e536d615186ab1f77e1b4e1e43d52ce252b571223bbed0710a82b024651a3')

package() {
    local _staging="${_pkgname}-${pkgver}-x86_64-linux"

    install -Dm755 "${_staging}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_staging}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find "${_staging}/icons/hicolor" -type f -name "*.svg" -exec install -Dm644 {} "${pkgdir}/usr/share/wayle/icons/{}" \;
}
