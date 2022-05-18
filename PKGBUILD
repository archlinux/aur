# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Xiaoxiao Pu <i@xiaoxiao.im>

pkgname=berate_ap-git
pkgver=r324.0b85d05
pkgrel=1
pkgdesc="A shell script to create a NATed/Bridged Software Access Point"
arch=('any')
url="https://github.com/sensepost/berate_ap"
license=('BSD')
depends=('hostapd-mana-git' 'iw' 'dnsmasq' 'iptables')
optdepends=('haveged: boost low entropy')
makedepends=('git')
provides=('berate_ap')
backup=('usr/lib/systemd/system/berate_ap.service')
source=("$pkgname::git+https://github.com/sensepost/berate_ap.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/berate_ap/LICENSE"
}
