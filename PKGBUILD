pkgname=vpnfailsafe-git
pkgver=r1.054da69
pkgrel=1
pkgdesc="IP leak prevention for OpenVPN"
arch=('any')
url="https://github.com/wknapik/vpnfailsafe"
license=('MIT')
depends=('bash' 'coreutils' 'grep' 'iproute2' 'iptables' 'openresolv' 'openvpn' 'procps-ng' 'sed')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wknapik/vpnfailsafe.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -D -m755 "${pkgname%-git}.sh" "${pkgdir}/etc/openvpn/${pkgname%-git}.sh"
    install -D -m644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
    install -D -m644 "example.conf" "${pkgdir}/usr/share/doc/${pkgname%-git}/example.conf"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
