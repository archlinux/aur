pkgname=openvpn-unroot-git
pkgver=r1.f2e4844
pkgrel=1
pkgdesc="Run OpenVPN without root privileges"
arch=('any')
url="https://github.com/wknapik/openvpn-unroot"
license=('MIT')
depends=('bash>=4.4.0' 'coreutils' 'findutils' 'glibc' 'grep' 'iproute2' 'openvpn' 'sed' 'shadow' 'sudo' 'util-linux' 'which')
optdepends=('systemd')
checkdepends=('bash>=4.4.0' 'bash-bats' 'coreutils' 'curl' 'docker' 'grep' 'make' 'openvpn' 'procps-ng' 'shellcheck' 'sudo')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wknapik/openvpn-unroot.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -D -m755 "${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
