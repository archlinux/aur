# Maintainer: Jas Singh <singh.jaskir@outlook.com>

pkgname=wayle-bin
_pkgname=wayle
pkgver=0.4.0
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
    'gtksourceview5'
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
sha256sums_x86_64=('bd1c7ca19cd2a6da605c704a1bbe7776f72db117a794ad3692fefcc3ccbfae81')

package() {
    local _staging="${_pkgname}-${pkgver}-x86_64-linux"

    install -Dm755 "${_staging}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${_staging}/${_pkgname}-settings" "${pkgdir}/usr/bin/${_pkgname}-settings"
    install -Dm644 "${_staging}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/share/wayle/icons"
    cp -r "${_staging}/icons/hicolor" "${pkgdir}/usr/share/wayle/icons/"

    install -Dm644 "${_staging}/completions/completions.bash" "${pkgdir}/usr/share/bash-completion/completions/wayle"
    install -Dm644 "${_staging}/completions/_wayle" "${pkgdir}/usr/share/zsh/site-functions/_wayle"
    install -Dm644 "${_staging}/completions/wayle.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/wayle.fish"

    install -Dm644 "${_staging}/wayle.service" "${pkgdir}/usr/lib/systemd/user/wayle.service"
    install -Dm644 "${_staging}/com.wayle.settings.desktop" \
        "${pkgdir}/usr/share/applications/com.wayle.settings.desktop"
    install -Dm644 "${_staging}/wayle-settings.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wayle-settings.svg"
}
