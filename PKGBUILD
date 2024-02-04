pkgname=xdg-ninja
pkgver=0.2.0.2
pkgrel=1
pkgdesc='A shell script which checks your $HOME for unwanted files and directories'
arch=('any')
url="https://github.com/b3nj5m1n/${pkgname}"
license=('MIT')
options=('!strip')

depends=('jq')
optdepends=('glow: for rendering markdown in the terminal')

_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6adfe289821b6b5e3778130e0d1fd1851398e3bce51ddeed6c73e3eddcb806c6')

package() {
    local bin='/usr/bin'
    local lib="/usr/lib/${pkgname}"

    local pkg_bin="${pkgdir}/${bin}"
    local pkg_lib="${pkgdir}/${lib}"
    install -dm755 "${pkg_bin}" "${pkg_lib}"

    cd "${_snapshot}"

    local exe="${pkg_bin}/${pkgname}"
    sed -e "s|XN_PROGRAMS_DIR=.*|XN_PROGRAMS_DIR='${lib}'|" 'xdg-ninja.sh' > "${exe}"
    chmod 755 "${exe}"

    cp -r 'programs' -T "${pkg_lib}"

    install -Dm644 'man/'* -t "${pkgdir}/usr/share/man"
    install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
