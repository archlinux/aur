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
targetarch=$( uname -m )
source=($url/releases/download/v$pkgver/camilladsp-linux-$targetarch.tar.gz
        camilladsp
        camilladsp.service
        camilladsp.yml)
sha256sums=('dab6f94363c97ad2569c458e53b04efdc571f2e7bbf94671378513a61ec1d9f3'
            '5d6329a22e663da880baeba2f1d7e29c444c7809982d601d1591150d2b9718f6'
            'ba659253f622cbda7945fced9ebd7a10ea409b8112e25f25e00db3125e082aa9'
            'e06d43c95f78865e77d6b65c943c27d5548cebd3572871f2e28b5fa4566b6a47')
			
build() {
    bsdtar xf camilladsp-linux-$targetarch.tar.gz -C $srcdir
}

package() {
    install -Dm 775 $srcdir/camilladsp -t $pkgdir/usr/bin
    install -d $pkgdir/srv/http/data/camilladsp/coeffs
    install -Dm 755 camilladsp.yml -t $pkgdir/srv/http/data/camilladsp/configs
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
    install -Dm 644 camilladsp -t $pkgdir/etc/default
}
