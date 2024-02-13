# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=2.0.2
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
sha256sums_x86_64=('43df984c2988b6c05578e320d39ea23f75eb30f24752815d5d3da1b3bf0427ba')
sha256sums_armv7h=('37c9d6d33262134bef31246b472811664e51de9a06773a8864e4e4cec4c3b56f')
sha256sums_aarch64=('f86fbbb522f3342129d72815f78c80b82aeab82f7a9328a5a7e720c903f858bd')

package() {
    cd $srcdir
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -d $pkgdir/etc/camilladsp/coeffs
    install -Dm 644 camilladsp.default $pkgdir/etc/default/camilladsp
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
    install -Dm 755 camilladsp.yml -t $pkgdir/etc/camilladsp/configs
    install -Dm 755 state.yml -t $pkgdir/etc/camilladsp
}
