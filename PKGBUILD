# Maintainer: pokrasko <dpokrasko at gmail dot com>
pkgname=nordvpn-s6
pkgver=20201020
pkgrel=1
pkgdesc="s6 service scripts for nordvpn-bin"
arch=('any')
depends=('nordvpn-bin' 's6')
optdepends=('wireguard-tools: necessary for NordLynx support')
provides=('nordvpn-runscripts')
conflicts=('nordvpn-runscripts')
backup=('etc/s6/sv/nordvpn-log/conf')
install=nordvpn.install
source=("nordvpn-log.conf"
        "nordvpn-log.consumer-for"
        "nordvpn-log.notification-fd"
        "nordvpn-log.pipeline-name"
        "nordvpn-log.run"
        "nordvpn-log.type"
        "nordvpn-srv.producer-for"
        "nordvpn-srv.run"
        "nordvpn-srv.type")
sha256sums=('8a3d2abcc40d355ca913f39871d24f6c770dd216fe075d2548e729b2ae952135'
            'ed40de44d786b0fe425ae2db45562ee5581fbda38cae3c7bf93020ee82afd1eb'
            '1121cfccd5913f0a63fec40a6ffd44ea64f9dc135c66634ba001d10bcf4302a2'
            '8b6e9f57a45c6722dfa6c7b2dcf232f57fd1af3f7a47bac66f1d0665d504635f'
            'b3ebbd11813452d23176c259615d5091f9ddbf7d4287ffb16a8c1d03b6fe04e2'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006'
            'c53437039c650267959acb7f100accb782d9dcb75d1e31e1936f854e8e6e3996'
            'd83c555a010a2ba531de17105b3845fbb12960e0025074f38fdad5f9fd9f4f1b'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in conf consumer-for notification-fd \
                pipeline-name producer-for run type; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm644 "$srcdir/$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'nordvpn-log'
    _inst_sv 'nordvpn-srv'

    echo "tun" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
