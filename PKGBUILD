# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Xiaoxiao Pu <i@xiaoxiao.im>

pkgname=create_ap-git
pkgver=r252.016fd2b
pkgrel=1
pkgdesc="A shell script to create a NATed/Bridged Software Access Point"
arch=('any')
url="https://github.com/oblique/create_ap"
license=('BSD')
depends=('hostapd' 'iw' 'dnsmasq' 'iptables')
optdepends=('haveged: boost low entropy')
makedepends=('git')
conflicts=('create_ap')
provides=('create_ap')
backup=('usr/lib/systemd/system/create_ap.service')
source=("$pkgname::git+https://github.com/oblique/create_ap")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/create_ap/LICENSE"
}
