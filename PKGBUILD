# Maintainer: Rubin Simons <me@rubin55.org>

_pkgname='dev-proxy'
pkgname="${_pkgname}-bin"
pkgver=2.0.0
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
sha256sums=('cccaff506c70a75c0dfc7529ec848e32e32355b8af679a5cf08729fbcfa97907')

package() {
    _pkgexe=$([[ "$_pkgver" =~ beta ]] && echo "devproxy-beta" || echo "devproxy")
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    unzip "${srcdir}/dev-proxy-linux-x64-v${_pkgver}.zip" -d "${pkgdir}/opt/${_pkgname}"
    chmod +x "${pkgdir}/opt/${_pkgname}/${_pkgexe}" "${pkgdir}/opt/${_pkgname}"/*.sh
    ln -sf "/opt/$_pkgname/${_pkgexe}" "${pkgdir}/usr/bin/devproxy"
}
