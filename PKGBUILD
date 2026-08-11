# Maintainer: nizne <nizne@outlook.com>
_pkgname=boring
pkgname=${_pkgname}-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="The $(boring) SSH tunnel manager (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/alebeck/boring"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-v${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-v${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('17428fc912685a642384408072a4fe9a1c6a0f6c14650ba4858f2212e1a1cfe1')
sha256sums_aarch64=('186021aec9df395caa5676bd34419516e20560c9becc8dd2194ec249c368cafd')

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
