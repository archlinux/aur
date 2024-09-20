# Maintainer: Funami
pkgname=ananicy-cpp-s6
pkgver=20240920
pkgrel=1
pkgdesc="s6-rc service scripts for ananicy-cpp"
arch=('any')
depends=('ananicy-cpp-nosystemd' 's6')
provides=('init-ananicy-cpp')
conflicts=('init-ananicy-cpp')
backup=('etc/s6/config/ananicy-cpp.conf')
source=('ananicy-cpp.conf'
        'ananicy-cpp-log.consumer-for'
        'ananicy-cpp-log.notification-fd'
        'ananicy-cpp-log.pipeline-name'
        'ananicy-cpp-log.run'
        'ananicy-cpp-log.type'
        'ananicy-cpp-srv.producer-for'
        'ananicy-cpp-srv.run'
        'ananicy-cpp-srv.type')
sha256sums=('8a3d2abcc40d355ca913f39871d24f6c770dd216fe075d2548e729b2ae952135'
            'daeda4c9b28413aa81454c3c6b23580bc0c946190c619134d62cffb11f05d1b9'
            '1121cfccd5913f0a63fec40a6ffd44ea64f9dc135c66634ba001d10bcf4302a2'
            'bf9877c2702063e6d44feab829ca70bee75086981724a93edea1a920d3a76998'
            '07f935b35f3096a165374d9d5fec90339755ac58d6bbf8dd41b1282bb9600fd5'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006'
            '69a946e03c7f201651502761598a2fb62cb9d43d6e16e111094f7b3fe1b6cbed'
            '2ba1503c15087a888ea5401dd243659f9d80dd2cbed4f48f6ccab00824c29bdd'
            'd0001a150b83f68f09004c5059045cb76a3f064eed4d42ce072bc3722c118006')

_inst_sv() {
    for file in consumer-for notification-fd pipeline-name producer-for run type; do
        if test -f "$1.$file"; then
            install -Dm644 "$1.$file" "$pkgdir/etc/s6/sv/$1/$file"
        fi
    done
}

package() {
    _inst_sv 'ananicy-cpp-log'
    _inst_sv 'ananicy-cpp-srv'
    install -Dm644 "ananicy-cpp.conf" -t "$pkgdir/etc/s6/config"
}
