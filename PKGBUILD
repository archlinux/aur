# Maintainer: Daniil Redchin <redchindaniil@gmail.com> <github.com/USSURATONCACHI>
pkgname=novpn
pkgver=1.4.0
pkgrel=1
pkgdesc="CLI tool to easily run programs with access to only one network device"
arch=('any')
url="https://github.com/USSURATONCACHI/novpn"
license=('Apache-2.0')

# Every single one is used and is essential
depends=('bash' 'switch-netns' 'iproute2' 'iptables' 'grep' 'gawk' 'coreutils' 'systemd')
makedepends=('coreutils')

install=novpn.install

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3254ef8ee681329cd300c4a791cc3403580c4d14a4d61466f2171bae15abee7f')

package() {
    novpn_srcdir="${srcdir}/novpn-${pkgver}/novpn_src"
    
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/configure_default"  "${pkgdir}/usr/bin/novpn_utils/configure_default"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/down"               "${pkgdir}/usr/bin/novpn_utils/down"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/get_gateway"        "${pkgdir}/usr/bin/novpn_utils/get_gateway"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/internal_add_rules" "${pkgdir}/usr/bin/novpn_utils/internal_add_rules"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/ip_offset"          "${pkgdir}/usr/bin/novpn_utils/ip_offset"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/params"             "${pkgdir}/usr/bin/novpn_utils/params"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/print_params"       "${pkgdir}/usr/bin/novpn_utils/print_params"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/up"                 "${pkgdir}/usr/bin/novpn_utils/up"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_utils/wait_for_device"    "${pkgdir}/usr/bin/novpn_utils/wait_for_device"

    install -Dm755 "${novpn_srcdir}/usr/bin/novpn"    "${pkgdir}/usr/bin/novpn"
    install -Dm755 "${novpn_srcdir}/usr/bin/novpn_ns" "${pkgdir}/usr/bin/novpn_ns"

    install -Dm644 "${novpn_srcdir}/usr/lib/systemd/system/novpn.service"  "${pkgdir}/usr/lib/systemd/system/novpn.service"

    install -Dm644 "${novpn_srcdir}/usr/lib/systemd/system/novpn-keepalive.service" "${pkgdir}/usr/lib/systemd/system/novpn-keepalive.service"
    install -Dm644 "${novpn_srcdir}/usr/lib/systemd/system/novpn-keepalive.timer"   "${pkgdir}/usr/lib/systemd/system/novpn-keepalive.timer"

    install -Dm644 "${novpn_srcdir}/etc/novpn" "${pkgdir}/etc/novpn"
}
