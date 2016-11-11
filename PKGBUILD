# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Xiaoxiao Pu <i@xiaoxiao.im>

_pkgname=create_ap
pkgname=${_pkgname}-git
pkgver=r211.64d06fb
pkgrel=1
pkgdesc="A shell script to create a NATed/Bridged Software Access Point"
arch=('any')
url="https://github.com/oblique/create_ap"
license=('BSD')
depends=('hostapd' 'iw' 'dnsmasq' 'iptables')
optdepends=('haveged: boost low entropy')
makedepends=('git')
backup=('usr/lib/systemd/system/create_ap.service')
source=("git+https://github.com/oblique/create_ap")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/create_ap"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/create_ap/"
    install -Dm755 "create_ap" "${pkgdir}/usr/bin/create_ap"
    install -Dm644 "bash_completion" "${pkgdir}/usr/share/bash-completion/completions/create_ap"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/create_ap/LICENSE"
    install -Dm644 "create_ap.service" "${pkgdir}/usr/lib/systemd/system/create_ap.service"
}
