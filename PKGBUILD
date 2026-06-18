# Maintainer: ToxicByte (aka. KylerianHD) <contact@kylerianhd.com>
pkgname=af-pro-display-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Service to display CPU and GPU temperatures in real-time on the Antec Flux Pro case display."
arch=('x86_64')
url="https://github.com/KylerianHD/antec-flux-pro-display"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'libusb' 'systemd-libs')
optdepends=('nvidia-utils: GPU temperature readout through NVML')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/af-pro-display-$pkgver-$CARCH-linux.tar.gz")
sha256sums_x86_64=('30d606f085eeff0311951414bd41b0506afc95e0d357d30650bc699f3106aba5')

package() {
    cd "af-pro-display-$pkgver-$CARCH-linux"

    # Binary
    install -Dm755 af-pro-display "$pkgdir/usr/bin/af-pro-display"

    # udev rules - grants session-based USB access via uaccess tag
    install -Dm644 99-af-pro-display.rules \
        "$pkgdir/usr/lib/udev/rules.d/99-af-pro-display.rules"

    # systemd service
    install -Dm644 af-pro-display.service \
        "$pkgdir/usr/lib/systemd/system/af-pro-display.service"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
