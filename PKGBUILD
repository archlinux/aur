# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
pkgname='minisatip-git'
pkgdesc="SAT>IP server for linux using local DVB-S2, DVB-S or DVB-T cards"
pkgver=0.3
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/catalinii/minisatip"
license=('GPL2')
provides=('minisatip')
conflicts=('minisatip')
makedepends=('git' 'libdvbcsa')
depends=('libdvbcsa')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
install='minisatip.install'
source=("git+https://github.com/catalinii/minisatip"
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('SKIP'
            '0eea34694767681b2b56529b0ad095f33ca3cd2bd29133b57e90ceb2806eba37'
            '423b4d0452907e2caa639cd4da17dd918fccb7a0cf3dc1a71c48b7811df8bc1e'
            'c47790245befba5f0c1424e48854a2c06f62edc819c797ff14a15e80128568bc')

pkgver() {
    cd ${srcdir}/minisatip
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/minisatip
    make
}

package() {
    cd ${srcdir}/minisatip
    install -Dm644 ../minisatip.service ${pkgdir}/usr/lib/systemd/system/minisatip.service
    install -Dm644 ../minisatip.sysuser ${pkgdir}/usr/lib/sysusers.d/minisatip.conf
    install -Dm644 ../minisatip.conf ${pkgdir}/etc/conf.d/minisatip
    install -Dm755 ./minisatip ${pkgdir}/usr/bin/minisatip
}
