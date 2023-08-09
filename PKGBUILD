# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=1.0.3
pkgrel=2
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config)
sourcefile=camilladsp-linux-$( sed -n -E '/^CARCH/ {s/.*="|h*"//g; p}' /etc/makepkg.conf ).tar.gz
source=($url/releases/download/v$pkgver/$sourcefile
        camilladsp.service
        camilladsp.yml)
sha256sums=('SKIP')

build() {
    install -d $srcdir/bin
    bsdtar xf $sourcefile -C $srcdir/bin
}

package() {
    install -Dm 775 $srcdir/bin/camilladsp -t $pkgdir/usr/bin
    install -d $pkgdir/srv/http/data/camilladsp/coeffs
    install -Dm 755 camilladsp.yml -t $pkgdir/srv/http/data/camilladsp/configs
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
    install -Dm 644 camilladsp -t $pkgdir/etc/default
}
