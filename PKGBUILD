# Maintainer: Rubin Simons <me@rubin55.org>

_pkgname='dev-proxy'
pkgname="${_pkgname}-bin"
pkgver=2.4.0
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
sha256sums=('458588d4f541f1bb5ac225d389e454a5242cb8251cad4ba9a6abd40da8c0c9d7')

package() {
    _pkgexe=$([[ "$_pkgver" =~ beta ]] && echo "devproxy-beta" || echo "devproxy")
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    unzip "${srcdir}/dev-proxy-linux-x64-v${_pkgver}.zip" -d "${pkgdir}/opt/${_pkgname}"
    chmod +x "${pkgdir}/opt/${_pkgname}/${_pkgexe}" "${pkgdir}/opt/${_pkgname}"/*.sh
    ln -sf "/opt/$_pkgname/${_pkgexe}" "${pkgdir}/usr/bin/devproxy"
}
