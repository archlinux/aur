# Maintainer: nizne <nizne@outlook.com>
_pkgname=boring
pkgname=${_pkgname}-bin
pkgver=0.17.0
pkgrel=1
pkgdesc='The boring SSH tunnel manager (prebuilt binary)'
arch=('x86_64' 'aarch64')
url="https://github.com/alebeck/boring"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-v${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-v${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('f70aeeae71c9a69fffdde0a33640f1694214f8246293196f9df5d46d83f3228b')
sha256sums_aarch64=('14b0df9c331c553b4b29b01d094c5029e2c761c11f0f32b7e253d190d8a28dec')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/share/bash-completion/completions"
    install -d "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -d "${pkgdir}/usr/share/zsh/site-functions"

    "${srcdir}/${_pkgname}" --shell bash >"${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    "${srcdir}/${_pkgname}" --shell fish >"${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    "${srcdir}/${_pkgname}" --shell zsh >"${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
