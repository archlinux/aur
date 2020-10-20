# Maintainer: pokrasko <dpokrasko at gmail dot com>
pkgname=teamviewer-s6
pkgver=20201020
pkgrel=1
pkgdesc="s6 service scripts for teamviewer"
arch=('any')
depends=('teamviewer' 'dbus-s6' 's6')
provides=('teamviewer-runscripts')
conflicts=('teamviewer-runscripts')
backup=('etc/s6/sv/teamviewer-log/conf')
install=teamviewer.install
source=("teamviewer-log.conf"
        "teamviewer-log.consumer-for"
        "teamviewer-log.notification-fd"
        "teamviewer-log.pipeline-name"
        "teamviewer-log.run"
        "teamviewer-log.type"
	"teamviewer-srv.dependencies" "teamviewer-srv.producer-for"
        "teamviewer-srv.run"
        "teamviewer-srv.type")
sha256sums=('8a3d2abcc40d355ca913f39871d24f6c770dd216fe075d2548e729b2ae952135'
            'ffd76bee9fd4f1d8e8042b587a25d75d96c07ee8d63820d80ff99cd74b9edf6e'
            '1121cfccd5913f0a63fec40a6ffd44ea64f9dc135c66634ba001d10bcf4302a2'
            'bd69c11da525c8434fdb97541fe7e8d033e550b36e1eb0bc3bcdc660b3fd78f5'
            '8b0928b1245080e1933686cb00cafef0c021503e05b1682fdd3b467d47611263'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006'
            '9291726828590f8d9d158572c381e2cefc24adf21055036cba07585acc1abb62'
            '387a2c7fbe0e04d5c3b77a04782728c80b229a405e6787f734d83fe182b9f575'
            '32b0a0ebe29cb20eba5f972be7178fa95214e77e06673908d602e00a9c5c94b5'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv(){
    for file in conf consumer-for dependencies notification-fd \
                pipeline-name producer-for run type; do
        if test -f "$srcdir/$1.$file"; then
            install -Dm644 "$srcdir/$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'teamviewer-log'
    _inst_sv 'teamviewer-srv'
}
