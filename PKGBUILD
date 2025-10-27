# Maintainer: Rubin Simons <me@rubin55.org>

_pkgname='dev-proxy'
pkgname="${_pkgname}-bin"
pkgver=1.3.0_beta.2
_pkgver="$(echo $pkgver | sed 's|_|-|g')"
pkgrel=1
pkgdesc="Simulate API failures, throttling, and chaos — all from your command line."
arch=('x86_64')
url="https://github.com/dotnet/dev-proxy"
license=('MIT')
provides=(${_pkgname})
options=('!strip')
makedepends=('unzip')
source=(${url}/releases/download/v${_pkgver}/${_pkgname}-linux-x64-v${_pkgver}.zip)
sha256sums=('d1e1dc7f568937bce698d1a2c277762c071290343eb228d73124cf14ec48ef7f')

package() {
    _pkgexe=$([[ "$_pkgver" =~ beta ]] && echo "devproxy-beta" || echo "devproxy")
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    unzip "${srcdir}/dev-proxy-linux-x64-v${_pkgver}.zip" -d "${pkgdir}/opt/${_pkgname}"
    chmod +x "${pkgdir}/opt/${_pkgname}/${_pkgexe}" "${pkgdir}/opt/${_pkgname}"/*.sh
    ln -sf "/opt/$_pkgname/${_pkgexe}" "${pkgdir}/usr/bin/devproxy"
}
