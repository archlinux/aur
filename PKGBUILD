# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
pkgname='minisatip-git'
pkgdesc="SAT>IP server for linux using local DVB-S2, DVB-S or DVB-T cards"
pkgver=r185.7dc9363
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/catalinii/minisatip"
license=('GPL2')
provides=('minisatip')
conflicts=('minisatip')
makedepends=('git')
depends=('libdvbcsa' 'linuxtv-dvb-apps')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
install='minisatip.install'
source=("git+https://github.com/catalinii/minisatip"
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('SKIP'
            '9e1d1c28bcf475547c87d9eb0bf5130a7e7c360ff7edb74ed586a2bf7161fd8f'
            '423b4d0452907e2caa639cd4da17dd918fccb7a0cf3dc1a71c48b7811df8bc1e'
            '42f3bb7ed053afa338535bd649b4738bf142a9d039010f6bd1a356cf51e80dbc')

pkgver() {
    cd ${srcdir}/minisatip
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/minisatip
    make DVBCA=yes
}

package() {
    cd ${srcdir}/minisatip
    install -Dm644 ../minisatip.service ${pkgdir}/usr/lib/systemd/system/minisatip.service
    install -Dm644 ../minisatip.sysuser ${pkgdir}/usr/lib/sysusers.d/minisatip.conf
    install -Dm644 ../minisatip.conf ${pkgdir}/etc/conf.d/minisatip
    install -Dm755 ./minisatip ${pkgdir}/usr/bin/minisatip
}
