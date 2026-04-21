# Maintainer: Ilyas Turki <turki.ilyass at gmail dot com>
pkgname=prayer-times-bin
_pkgname=prayer-times
pkgver=0.4.3
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
    "${_pkgname}.service-${pkgver}::${url}/raw/v${pkgver}/contrib/${_pkgname}.service"
)
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/prayer-times-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/prayer-times-linux-arm64")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('a861b4d054d7358eab0fa3880b9c9566f5f29b5dbecc66ebc86170757b734320')
sha256sums_aarch64=('4a388fbe5a975c8cc85f05cb873ce8ee8f133e570a3a1bbd18aa544f84f1706a')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${_pkgname}.bash-${pkgver}" \
        "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "_${_pkgname}-${pkgver}" \
        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "${_pkgname}.fish-${pkgver}" \
        "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

    install -Dm644 "${_pkgname}.service-${pkgver}" \
        "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
