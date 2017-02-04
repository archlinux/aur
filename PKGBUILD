# Maintainer: Ethan Madison (aur<at>ethanmad<dot>com)

pkgname=pia-tools
pkgver=1.1.1
pkgrel=1
pkgdesc="OpenVPN hook for privateinternetaccess.com"
arch=("any")
url="https://github.com/pschmitt/pia-tools"
license=("GPL3")
depends=("transmission-cli" "bind-tools" "openvpn" "systemd" "sudo" "wget" "ufw" "unzip" "sed")
source=("pia-tools-$pkgver.tar.gz::https://github.com/pschmitt/pia-tools/archive/$pkgver.tar.gz")
sha256sums=('a884dc99e06b9c4dcb72ea8e4c661ac9b775838ccca6b4aff1526bd4daaccaf9')
install="${pkgname}.install"

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pia-tools "${pkgdir}/usr/bin/pia-tools"
    install -Dm644 pia-tools.groff "${pkgdir}/usr/share/man/man1/pia-tools.1"
    install -Dm644 pia@.service "${pkgdir}/usr/lib/systemd/system/pia@.service"
    install -Dm644 pia-tools-update.service "${pkgdir}/usr/lib/systemd/system/pia-tools-update.service"
    install -Dm644 pia-tools-update.timer "${pkgdir}/usr/lib/systemd/system/pia-tools-update.timer"
    install -Dm644 pia_common "${pkgdir}/etc/openvpn/pia/pia_common"
    install -Dm755 pia-up "${pkgdir}/etc/openvpn/pia/pia-up"
    install -Dm755 pia-down "${pkgdir}/etc/openvpn/pia/pia-down"
    install -Dm755 pia-up "${pkgdir}/etc/openvpn/pia/pia-up.custom.sample"
    install -Dm755 pia-down "${pkgdir}/etc/openvpn/pia/pia-down.custom.sample"
    # Activate the ovpn update service
    install -d -m755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
    ln -s ../pia-tools-update.timer "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/pia-tools-update.timer"
}
