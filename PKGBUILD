# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=3.2.0
pkgrel=2
pkgdesc="An open-source service monitoring system and time series database (binary, not built from source)"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://prometheus.io"
license=('Apache')
depends=()
makedepends=()
provides=('prometheus')
conflicts=('prometheus' 'prometheus-git')
install='prometheus.install'
backup=('etc/prometheus/prometheus.yml')
source=('prometheus.service')
sha256sums=('0c99b68b282d72feb9fd2bc0b190554659a59dada74ec92ca2b2f48016a9b805')
sha256sums_x86_64=('20e1ee6b14f65897c0378a507ad1a57f500a3aa79a64ba427d80b7efe432f667')
sha256sums_arm=('2a2b3411d1afbb1bf831b85d6b2fe899341b8ebdcf66d9eedc384a31744a150d')
sha256sums_armv6h=('461fcb596b8906eb0543055f8d2aebc805f5325152d2c89333442dc348c0cd10')
sha256sums_armv7h=('6f0bef048331f0a491eb2f0b9deb1a5bd35ec1dbffcd99f522b14f213afdb943')
sha256sums_aarch64=('3531b2e466f1b6cf21463e21e07ab4e25e606c172a1782b3aff28b7a62905744')
source_x86_64=("https://github.com/prometheus/prometheus/releases/download/v$pkgver/prometheus-$pkgver.linux-amd64.tar.gz")
source_arm=("https://github.com/prometheus/prometheus/releases/download/v$pkgver/prometheus-$pkgver.linux-armv5.tar.gz")
source_armv6h=("https://github.com/prometheus/prometheus/releases/download/v$pkgver/prometheus-$pkgver.linux-armv6.tar.gz")
source_armv7h=("https://github.com/prometheus/prometheus/releases/download/v$pkgver/prometheus-$pkgver.linux-armv7.tar.gz")
source_aarch64=("https://github.com/prometheus/prometheus/releases/download/v$pkgver/prometheus-$pkgver.linux-arm64.tar.gz")

package() {
    case "$CARCH" in
        'x86_64') ARCH='amd64';;
        'arm') ARCH='armv5';;
        'armv6h') ARCH='armv6';;
        'armv7h') ARCH='armv7';;
        'aarch64') ARCH='arm64';;
    esac
    cd "${srcdir}/prometheus-${pkgver}.linux-${ARCH}"

    # Install Binaries
    install -D -m0755 prometheus \
        "${pkgdir}/usr/bin/prometheus"

    install -D -m0755 promtool \
        "${pkgdir}/usr/bin/promtool"

    # Install Config File
    install -D -m0755 prometheus.yml \
        "${pkgdir}/etc/prometheus/prometheus.yml"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus.service"
}
