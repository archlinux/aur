# Maintainer: Roc Gwei <roc dot gui at foxmail dot com>

pkgbase=airconnect-bin
pkgname=(
    'airconnect-airupnp-bin'
    'airconnect-aircast-bin'
)

pkgver=1.10.1
pkgrel=1
pkgdesc="AirPlay bridge for DLNA/UPnP and Chromecast devices"
arch=( 'x86_64' 'aarch64')
url="https://github.com/philippe44/AirConnect"
license=(MIT)

depends=(
    glibc
)

options=(!strip)

source=(
    "AirConnect-${pkgver}.zip::https://github.com/philippe44/AirConnect/releases/download/${pkgver}/AirConnect-${pkgver}.zip"
    airupnp.service
    aircast.service
)

sha256sums=('ea0fdad7a1aeb837ee99b2c21aad7e4c3ce84de03c2e86ac64bed804b87588b0'
            'a67281019c753010efc35ade083fb5f48a28353d4c8df6e03320767afbf885b2'
            '54d9d2e035dbb03addda55ad444fd55a619153180616b4c685547a7c5683401d')

package_airconnect-airupnp-bin() {
    pkgdesc="AirPlay to UPnP/DLNA/Sonos bridge"

    provides=(airupnp)
    conflicts=(airupnp)

    install -Dm755 \
        "${srcdir}/airupnp-linux-${CARCH}" \
        "${pkgdir}/usr/bin/airupnp"

    install -Dm644 \
        "${srcdir}/airupnp.service" \
        "${pkgdir}/usr/lib/systemd/system/airupnp.service"
}

package_airconnect-aircast-bin() {
    pkgdesc="AirPlay to Chromecast bridge"

    provides=(aircast)
    conflicts=(aircast)

    install -Dm755 \
        "${srcdir}/aircast-linux-${CARCH}" \
        "${pkgdir}/usr/bin/aircast"

    install -Dm644 \
        "${srcdir}/aircast.service" \
        "${pkgdir}/usr/lib/systemd/system/aircast.service"
}
