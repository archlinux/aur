# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=pia-tools-orig
pkgver=0.9.8.0
pkgrel=1
pkgdesc='OpenVPN hook for privateinternetaccess.com'
arch=('any')
url='https://github.com/pschmitt/pia-tools'
license=('GPL3')
depends=('transmission-cli' 'bind-tools' 'openvpn' 'systemd' 'sudo' 'wget' 'ufw' 'unzip' 'sed')
source=('https://raw.github.com/pschmitt/pia-tools/master/pia-tools'
        'https://raw.github.com/pschmitt/pia-tools/master/pia-tools.groff'
        'https://raw.github.com/pschmitt/pia-tools/master/pia@.service'
        'https://raw.github.com/pschmitt/pia-tools/master/pia_common'
        'https://raw.github.com/pschmitt/pia-tools/master/pia-up'
        'https://raw.github.com/pschmitt/pia-tools/master/pia-down'
        'https://raw.github.com/pschmitt/pia-tools/master/pia-tools.install'
        'https://raw.github.com/pschmitt/pia-tools/master/pia-tools-update.service'
        'https://raw.github.com/pschmitt/pia-tools/master/pia-tools-update.timer')
sha256sums=('25945e042899843ed5d39807bc07e7433321d12918c5e299d0308b13c2397e3b'
            '22a34cb38e02ee1ed32e5697bc507df074629cbf5f1f7290a72e2c947cf611eb'
            '118d961db36fb243e059543215a818d1546ec94e8d52b24c75b7de6fe64ba749'
            'b571a8edbd9cb2a9ad63fadf360f64d4f80e291295f6c851b3a716c291ba3f8d'
            '063ee23a9c98e728168affb8056cda201fb02ede2bd29dfe2b768ce834b35e7c'
            '12299e53b5024084c73e604132db3a10b6e91763d90d484cabdd1985a17cf733'
            'a7e82a1589406477898adee768d17c0270c8bcf341ae72be823095331c4e99c5'
            '9c85077075dc9192109abb9736f5905721574ce3b902f6d709afc6e262c8ed29'
            'dee96c9e2a3f8d447d1d8aafbb1fc10fcd124e89239f1078311d5ce2c963359f')
install="pia-tools.install"

package() {
    cd "${srcdir}"
    install -Dm755 pia-tools "${pkgdir}/usr/bin/pia-tools"
    install -Dm644 pia-tools.groff "${pkgdir}/usr/share/man/man1/pia-tools.1"
    install -Dm644 pia@.service "${pkgdir}/usr/lib/systemd/system/pia@.service"
    install -Dm644 pia-tools-update.service "${pkgdir}/usr/lib/systemd/system/pia-tools-update.service"
    install -Dm644 pia-tools-update.timer "${pkgdir}/usr/lib/systemd/system/pia-tools-update.timer"
    install -Dm644 pia_common "${pkgdir}/etc/openvpn/pia/pia_common"
    install -Dm755 pia-up "${pkgdir}/etc/openvpn/pia/pia-up"
    install -Dm755 pia-up "${pkgdir}/etc/openvpn/pia/pia-down"
    # Activate the ovpn update service
    install -d -m755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
    ln -s ../pia-tools-update.timer "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/pia-tools-update.timer"
}
