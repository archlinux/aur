pkgname=caches-manager
pkgver=0.1.7
pkgrel=1
pkgdesc="A simple script that helps keep selected directories clean by symlinking or binding to tmpfs ramdisk."
arch=('any')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
options=('!strip')

_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('69553fb7b92d5104488687be1e6346f84ba06f726fc70791081a32b3a7613d1e')

package() {
    local bin="${pkgdir}/usr/bin"
    local lib="${pkgdir}/usr/lib"
    local etc="${pkgdir}/etc/caches-manager"
    install -dm755 "${bin}" "${lib}" "${etc}"

    cd "${_snapshot}"
    install -Dm755 -t "${bin}" "caches-manager"
    cp -rdt "${lib}" "systemd"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"

    cd "config"
    install -Dm644 -t "${etc}/system" "system.conf.example"
    install -Dm644 -t "${etc}/user" "user.conf.example"
}
