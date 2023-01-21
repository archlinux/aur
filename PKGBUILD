# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=1.0.3
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv6h armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config rust)
source=(https://github.com/HEnquist/camilladsp/archive/refs/tags/v$pkgver.tar.gz
        camilladsp.service
        camilladsp.yml)
sha256sums=('6b2c239390024f5f5dfebd2c8a8089acbebc81b6addfe3af68153064e5e36612'
            '993f05f04e1627b1739046e3c59d880deec1d4849525fa0e633dda5493923b48'
            'ebc1207ffd8ae8339b2c22939f61d027485b286f4d402afca0a8a9930d5ea46f')

backup=('srv/http/data/camilladsp/configs/camilladsp.yml')

build() {
    cd $srcdir/$pkgname-$pkgver
    cargo build --release
}

package() {
    install -Dm 775 $srcdir/$pkgname-$pkgver/target/release/camilladsp -t $pkgdir/usr/bin
    install -Dm 755 -g http -o http camilladsp.yml -t $pkgdir/srv/http/data/camilladsp/configs
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
}
