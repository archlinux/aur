# Maintainer: Funami
pkgname=coredns-s6
pkgver=20220507
pkgrel=1
pkgdesc="s6-rc service scripts for coredns"
arch=('any')
depends=('coredns' 'util-linux' 's6')
provides=('init-coredns')
conflicts=('init-coredns')
backup=('etc/s6/config/coredns.conf')
source=('coredns.conf'
        'coredns-log.consumer-for'
        'coredns-log.notification-fd'
        'coredns-log.pipeline-name'
        'coredns-log.run'
        'coredns-log.type'
        'coredns-srv.producer-for'
        'coredns-srv.run'
        'coredns-srv.type')
sha256sums=('8a3d2abcc40d355ca913f39871d24f6c770dd216fe075d2548e729b2ae952135'
            '6421dbbecad82677e4d6adf77303bccf1f6833c87bd901d9a89e2f52d01c9fda'
            '1121cfccd5913f0a63fec40a6ffd44ea64f9dc135c66634ba001d10bcf4302a2'
            'e420cd85ee10e569e5dd0a2d7a16ba64caf669c2243e668cebb92bf4a12179b2'
            '0587215650201c054407bbc74d50d278bf670831659ed540e36e9fae566c08c9'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006'
            '3d21334d0330d5de357dd2ae048eff0c2f5f0bbb21d39bc6ab1e2b04915f5036'
            '969412b20adf2ad64fb2d7fb318020ef97a9cfe4921c2d1085c1432084d61274'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv() {
    for file in consumer-for notification-fd pipeline-name producer-for run type; do
        if test -f "$1.$file"; then
            install -Dm644 "$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'coredns-log'
    _inst_sv 'coredns-srv'
    install -Dm644 "coredns.conf" -t "$pkgdir/etc/s6/config"
}
