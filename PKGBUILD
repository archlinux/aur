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
        camilladsp
        camilladsp.service
        camilladsp.yml)
sha256sums=('dab6f94363c97ad2569c458e53b04efdc571f2e7bbf94671378513a61ec1d9f3'
            '5d6329a22e663da880baeba2f1d7e29c444c7809982d601d1591150d2b9718f6'
            '2ddfad846b2a6e57a27302849c03e47e5ce062b3365cb67d8525c80963bef689'
            'e06d43c95f78865e77d6b65c943c27d5548cebd3572871f2e28b5fa4566b6a47')

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
