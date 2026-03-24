# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
pkgname=snd-dante-pcie-dkms
pkgver=0.0.1
pkgrel=1
pkgdesc="ALSA kernel driver for Digigram LX-DANTE / Audinate Dante PCIe cards"
arch=('x86_64')
url="https://github.com/chris-ritsen/snd-dante-pcie"
license=('GPL')
depends=('dkms')
optdepends=('python-numpy: dante-live.py dashboard')
provides=('snd-dante-pcie')
conflicts=('dante-pcie-dkms' 'snd-dante-pcie-dkms-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chris-ritsen/snd-dante-pcie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "snd-dante-pcie-$pkgver"

    local dkms_dir="$pkgdir/usr/src/snd-dante-pcie-$pkgver"
    install -Dm644 snd-dante-pcie.c "$dkms_dir/snd-dante-pcie.c"
    install -Dm644 Makefile "$dkms_dir/Makefile"
    install -Dm644 dkms.conf "$dkms_dir/dkms.conf"

    install -Dm755 dante-live.py "$pkgdir/usr/bin/dante-live"
    install -Dm644 docs/observed_fpga_behavior.md "$pkgdir/usr/share/doc/$pkgname/observed_fpga_behavior.md"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
