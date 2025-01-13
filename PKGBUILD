# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=3.0.0
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
            '49020d37bb93a0f9a0c2cf9203d5099d2e8469961ba059f6d251d374e0efb04f'
            'b1cf5192986ee4497546bf9d58c64b28f9c7d2d1e3efb4ef7b69fedd4a7904d1')
sha256sums_x86_64=('0a1bcc10368f8cc966dd9b6b07105f6327422510cc01ac94ce530ac4db0d949b')
sha256sums_armv7h=('502dc0033cde3ab0fa48cbd5c0ef74cfcb84253dd7e1070e0b0a54a7290ba0bf')
sha256sums_aarch64=('5c8d161e9e3739aa67a61d8c7790b461449201861b4df65289f86325da21bbae')
package() {
    cd $srcdir
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -d $pkgdir/etc/camilladsp/coeffs
    install -Dm 644 camilladsp.default $pkgdir/etc/default/camilladsp
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
    install -Dm 755 camilladsp.yml -t $pkgdir/etc/camilladsp/configs
    install -Dm 755 state.yml -t $pkgdir/etc/camilladsp
}
