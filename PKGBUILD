# Maintainer: Fox-sys@berestovborisasz@gmail.com
pkgname=amdgpu-fan-curve
pkgver=1.0
pkgrel=1
pkgdesc="Custom fan curve script and systemd service for AMD RDNA3 GPUs"
arch=('any')
url="https://github.com/Fox-sys/amdgpu-custom-fan-curve"
license=('MIT')
depends=('bash')
source=('amdgpu-fan-curve'
        'fan_curve_default'
        'amdgpu-fan.service'
        'amdgpu-fan-curve.1')
sha256sums=('0757c67946e1e1453f712c117812dfb4d59a40c2c12be1fc199808aed8300863'
            'cb37e5ab3b29aa87c7b3e583fcbeac790ff98d667dc48c1381c636907bd3cbf9'
            'c06734e6cebeb107d6d3539ad82e187c6f60711800ea24237c54db324441afb6'
            'b2255eb5d20a342bebc6d5804989be021ac05ff8c3c8ed368048f762a58750a1')

package() {
    install -Dm755 "$srcdir/amdgpu-fan-curve" "$pkgdir/usr/bin/amdgpu-fan-curve"
    install -Dm644 "$srcdir/fan_curve_default" "$pkgdir/var/fan_curves/fan_curve_default"
    install -Dm644 "$srcdir/amdgpu-fan.service" "$pkgdir/etc/systemd/system/amdgpu-fan.service"
    install -Dm644 "$srcdir/amdgpu-fan-curve.1" "$pkgdir/usr/share/man/man1/amdgpu-fan-curve.1"

    chgrp video "$pkgdir/var/fan_curves"
    chmod 775 "$pkgdir/var/fan_curves"
    chgrp video "$pkgdir/var/fan_curves/fan_curve_default"
    chmod 664 "$pkgdir/var/fan_curves/fan_curve_default"
}