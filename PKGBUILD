pkgname=xdg-ninja
pkgver=0.2.0.1
pkgrel=1
pkgdesc='A shell script which checks your $HOME for unwanted files and directories.'
arch=('any')
url="https://github.com/b3nj5m1n/${pkgname}"
license=('MIT')

depends=('jq')
optdepends=('glow: for rendering markdown in the terminal')
options=('!strip')

_snapshot="${pkgname}-${pkgver}"

source=("${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f4f9ab4500e7cf865ff8b68c343537e27b9ff1e6068cb1387e516e608f77cec8')

package() {
    cd "${_snapshot}"
    local bin="${pkgdir}/usr/bin"
    local lib="${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 -t "${lib}" "${pkgname}.sh"
    install -dm755 "${bin}"
    ln -s "${lib#${pkgdir}}/${pkgname}.sh" "${bin}/${pkgname}"
    cp -rpt "${lib}" "programs"
}
