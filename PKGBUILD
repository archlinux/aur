# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Patrick Bartels <pckbls@gmail.com>

pkgname=sndio
pkgver=1.3.0
pkgrel=1
epoch=1
pkgdesc='Small audio and MIDI framework part of the OpenBSD project'
arch=('i686' 'x86_64')
url='http://www.sndio.org/'
license=('ISC')
depends=('alsa-lib')
install="$pkgname.install"
backup=('etc/conf.d/sndiod')
source=("http://www.sndio.org/${pkgname}-${pkgver}.tar.gz"
        'sndiod.conf'
        'sndiod.service')
sha256sums=('bcc33213f02adc71bd0c3543f3b243847e7d27c5243b0b558182bc1b3056e4b1'
            '231404ff10698c168bed189d09dc6b6642c0ea624175ca8a441162a4b5abc1fb'
            '1e21e02c833b3f30c3f7965b1affa768dc8bb09b459a6aadf43a566269928ee4')

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure \
        --prefix='/usr' \
        --enable-alsa
        
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 "$srcdir/sndiod.conf"    "$pkgdir/etc/conf.d/sndiod"
    install -D -m644 "$srcdir/sndiod.service" "$pkgdir/usr/lib/systemd/system/sndiod.service"
}
