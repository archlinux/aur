# Maintainer: agony <27015 at riseup dot net>

pkgname=tinyice-bin
pkgver=2.12.3
pkgrel=1
pkgdesc='Icecast-compatible streaming server for audio and video (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/DatanoiseTV/tinyice'
license=('Apache-2.0')
depends_x86_64=('glibc')
provides=("tinyice=${pkgver}")
conflicts=('tinyice')
install=tinyice.install
_release="${url}/releases/download/v${pkgver}"
source=("tinyice-${pkgver}.service::https://raw.githubusercontent.com/DatanoiseTV/tinyice/v${pkgver}/packaging/tinyice.service"
        'tinyice.sysusers'
        'tinyice.tmpfiles')
source_x86_64=("tinyice-${pkgver}-x86_64::${_release}/tinyice-linux-amd64")
source_aarch64=("tinyice-${pkgver}-aarch64::${_release}/tinyice-linux-arm64")
sha256sums=('f619529840a179e35f1a1466d044fed4e86e8183256dff4115cd5a0ccc14f4b0'
            '03ccb8a881692e4b49498999087a717b647620c3ce754ed8168376de2194663d'
            'ce5c426ecc09f9c877320a2293a4b60b1bca0b84ee8242f527ab8f9abb85ab0b')
sha256sums_x86_64=('1af54b9e1d4e6c71f89dfc50772215ccdbf9b006ec7be002e89488e6f9b003fb')
sha256sums_aarch64=('c8f67cf32724cbf97ea73c27d3a3b7de09283ad0dbbf396abcaf8b61b8246a17')

package() {
  install -Dm755 "tinyice-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/tinyice"
  install -Dm644 "tinyice-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/tinyice.service"
  install -Dm644 tinyice.sysusers "${pkgdir}/usr/lib/sysusers.d/tinyice.conf"
  install -Dm644 tinyice.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/tinyice.conf"
}
