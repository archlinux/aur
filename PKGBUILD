# Maintainer: Ilyas Turki <turki.ilyass at gmail dot com>
pkgname=prayer-times-bin
_pkgname=prayer-times
pkgver=0.4.1
pkgrel=1
pkgdesc="Islamic Prayer Times Information and Notifications"
arch=('x86_64' 'aarch64')
url="https://github.com/Yasso9/prayer-times"
license=('MIT')
depends=('dbus' 'openssl')
provides=('prayer-times')
conflicts=('prayer-times')
options=('!strip')

source=(
    "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
    "README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
    "${_pkgname}.bash-${pkgver}::${url}/releases/download/v${pkgver}/prayer-times.bash"
    "_${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/_prayer-times"
    "${_pkgname}.fish-${pkgver}::${url}/releases/download/v${pkgver}/prayer-times.fish"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/prayer-times-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/prayer-times-linux-arm64")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('d4c668c08d45712ae978a18b59761bd9f0d5c7f03a86c9f790ac01abbb446a8d')
sha256sums_aarch64=('f4f8b0f0d564bdd93b00eda1a2d2ccb45bff51e18ef67eb37973ce31cc9ac1e4')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${_pkgname}.bash-${pkgver}" \
        "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "_${_pkgname}-${pkgver}" \
        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "${_pkgname}.fish-${pkgver}" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
