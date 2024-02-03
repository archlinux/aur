# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=2.0.1
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(x86_64 armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config)
source=(camilladsp.default
        camilladsp.service
        camilladsp.yml
        state.yml)
source_armv7h=($url/releases/download/v$pkgver/camilladsp-linux-armv7.tar.gz)
source_aarch64=(${source_armv7h/armv7/aarch64})
source_x86_64=(${source_armv7h/armv7/amd64})
sha256sums=('245d0ba135c81590ea5d8a1eb68741daf055192869128cad26242924dbcd5144'
            '2ddfad846b2a6e57a27302849c03e47e5ce062b3365cb67d8525c80963bef689'
            'd5502496a7858256e0bef2c45f190b9a73628c9ece2b35f5bff020157b18578b'
            'b1cf5192986ee4497546bf9d58c64b28f9c7d2d1e3efb4ef7b69fedd4a7904d1')
sha256sums_x86_64=('5300dfa92c84d03706be780686f732173bce6a1130f62e5e140f0f21b84711b2')
sha256sums_armv7h=('8525f17285521c774cc7128fbb0a036e31a1a011e7160f0dc15eeff67fe83924')
sha256sums_aarch64=('86dec15fe7a23afc8d78c57865782f92d5a0a01e68e081a257df9efbd1255600')

package() {
    cd $srcdir
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -d $pkgdir/etc/camilladsp/coeffs
    install -Dm 644 camilladsp.default $pkgdir/etc/default/camilladsp
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
    install -Dm 755 camilladsp.yml -t $pkgdir/etc/camilladsp/configs
    install -Dm 755 state.yml -t $pkgdir/etc/camilladsp
}
