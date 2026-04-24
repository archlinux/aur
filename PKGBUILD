# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=4.1.3
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(x86_64 armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config)
install=camilladsp.install
source=(camilladsp.default
        camilladsp.install
        camilladsp.service
        camilladsp.yml
        state.yml)
source_armv7h=($url/releases/download/v$pkgver/camilladsp-linux-armv7.tar.gz)
source_aarch64=(${source_armv7h/armv7/aarch64})
source_x86_64=(${source_armv7h/armv7/amd64})

sha256sums=('245d0ba135c81590ea5d8a1eb68741daf055192869128cad26242924dbcd5144'
            '25d68017e71bf4c1972a84dc8f675670ada810f2e3ef6dbe96f08fa227f3d3d4'
            '2ddfad846b2a6e57a27302849c03e47e5ce062b3365cb67d8525c80963bef689'
            'd0e08597cce823f437eb69ef6433e5d3456c9899b9d2225b1c8bf831aa58994b'
            'b1cf5192986ee4497546bf9d58c64b28f9c7d2d1e3efb4ef7b69fedd4a7904d1')
sha256sums_x86_64=('55f5ec2ed80fcc79a543672f9f89ace4557d290d80584ef31ee0442111bd0b11')
sha256sums_armv7h=('dd1af57129e078383e2a1d5dc28cc13f3f02a78dce9247eb7d9232731b8f7609')
sha256sums_aarch64=('d9a17092923ebfe5d20a770c6b6a7eb2268f9700f999bf604b9db09f518aca5a')

package() {
    cd $srcdir
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -d $pkgdir/etc/camilladsp/coeffs
    install -Dm 644 camilladsp.default $pkgdir/etc/default/camilladsp
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
    install -Dm 755 camilladsp.yml -t $pkgdir/etc/camilladsp/configs
    install -Dm 755 state.yml -t $pkgdir/etc/camilladsp
}
