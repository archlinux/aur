# Maintainer: Funami
pkgname=mullvad-vpn-s6
pkgver=20221028
pkgrel=1
pkgdesc="s6-rc service scripts for mullvad-vpn"
arch=('any')
depends=('mullvad-vpn' 's6')
provides=('init-mullvad-vpn')
conflicts=('init-mullvad-vpn')
backup=('etc/s6/config/mullvad-vpn.conf')
source=('mullvad-vpn.conf'
        'mullvad-vpn-log.consumer-for'
        'mullvad-vpn-log.notification-fd'
        'mullvad-vpn-log.pipeline-name'
        'mullvad-vpn-log.run'
        'mullvad-vpn-log.type'
        'mullvad-vpn-srv.producer-for'
        'mullvad-vpn-srv.run'
        'mullvad-vpn-srv.type')
sha256sums=('8a3d2abcc40d355ca913f39871d24f6c770dd216fe075d2548e729b2ae952135'
            'b981765e30c23ca65b5cce7bd865e51bb75a761ff694c41925d0d7408d076af0'
            '1121cfccd5913f0a63fec40a6ffd44ea64f9dc135c66634ba001d10bcf4302a2'
            '2c073fafdd82eb0d5f95021949df0d3f244972d02000a22c2b675f1633d315b9'
            '1bb88c6ea06c1d1fb63f36dcbf5f1ccbb93d1d9c0757cf8d6a9a3fca84df388d'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006'
            'df44fddd79add956bf7094c8b14353e4f4db83e8511327623a3889543ef58bc8'
            'a1728cf44e57f37951406388e5b25a780cfac7d3a18ee0c651a81ee1c1d10a18'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv() {
    for file in consumer-for notification-fd pipeline-name producer-for run type; do
        if test -f "$1.$file"; then
            install -Dm644 "$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'mullvad-vpn-log'
    _inst_sv 'mullvad-vpn-srv'
    install -Dm644 "mullvad-vpn.conf" -t "$pkgdir/etc/s6/config"
}
