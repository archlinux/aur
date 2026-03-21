# Maintainer: dalmatheo <aur@dalmatheo.dev>

pkgname=procon2-driver-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="An unofficial Nintendo Switch™ 2 Pro Controller driver."
arch=('x86_64')
url="https://github.com/dalmatheo/procon2-driver"
license=('MIT')

# These dependencies are based on namcap analysis of the pre-compiled binary.
depends=(
    'libusb'
    'glibc'
)

provides=("procon2-driver")
conflicts=("procon2-driver")

# !debug is used because this is a pre-compiled binary; we cannot generate debug symbols.
options=('!debug')

source=(
    "https://github.com/dalmatheo/procon2-driver/releases/download/v${pkgver}/procon2-driver"
    "https://raw.githubusercontent.com/dalmatheo/procon2-driver/main/LICENSE"
    "https://raw.githubusercontent.com/dalmatheo/procon2-driver/main/procon2-driver.service"
)

sha256sums=('fca6992ffc0284db691fc56d6ba70f11005cbf7de4ee4288bd7a52f78939e43b'
            'c97983a0117fee05fbc11415b4c04501a08e3b59150157d9cece33ddf8503a41'
            '849b35b260f48464191b251223854bd572b9fb774e7e83ead5e94b1c6114d3b3')

package() {
    install -Dm755 "${srcdir}/procon2-driver" "${pkgdir}/usr/bin/procon2-driver"
    install -Dm644 "${srcdir}/procon2-driver.service" "${pkgdir}/usr/lib/systemd/system/procon2-driver.service"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
