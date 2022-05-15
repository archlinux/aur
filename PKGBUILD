# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=1.0.0
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv6h armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config)
source=(https://github.com/HEnquist/camilladsp/archive/refs/tags/v$pkgver.tar.gz
        camilladsp.service
        camilladsp.yml)
sha256sums=('9de8d7759fa738206e6dd21596a72736aa1841927cc81c359c8d726d22c8a4ad'
            '993f05f04e1627b1739046e3c59d880deec1d4849525fa0e633dda5493923b48'
            'dd7932754e220e3e68250dae326ce6a81f6a61ce7923f6e001c9c3c1787a3b07')
backup=('srv/http/data/camilladsp/configs/camilladsp.yml')

build() {
    cd $srcdir/$pkgname-$pkgver
    cargo build --release
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -Dm 775 $srcdir/$pkgname-$pkgver/target/release/camilladsp -t $pkgdir/usr/bin
    install -Dm 755 -g http -o http camilladsp.yml -t $pkgdir/srv/http/data/camilladsp/configs
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
}
