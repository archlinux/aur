# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="An open-source service monitoring system and time series database (binary, not built from source)"
arch=('x86_64' 'arm' 'armv6h' 'armv7h')
url="http://prometheus.io"
license=('Apache')
depends=()
makedepends=()
provides=('prometheus')
conflicts=('prometheus' 'prometheus-git')
install='prometheus.install'
backup=('etc/prometheus/prometheus.yml')
source=('prometheus.service')
source_x86_64=("https://github.com/prometheus/prometheus/releases/download/v${pkgver}/prometheus-${pkgver}.linux-amd64.tar.gz" )
source_arm=("https://github.com/prometheus/prometheus/releases/download/v${pkgver}/prometheus-${pkgver}.linux-armv5.tar.gz" )
source_armv6h=("https://github.com/prometheus/prometheus/releases/download/v${pkgver}/prometheus-${pkgver}.linux-armv6.tar.gz" )
source_armv7h=("https://github.com/prometheus/prometheus/releases/download/v${pkgver}/prometheus-${pkgver}.linux-armv7.tar.gz" )
sha256sums=('0c99b68b282d72feb9fd2bc0b190554659a59dada74ec92ca2b2f48016a9b805')
sha256sums_x86_64=('8f1f9ca9dbc06e1dc99200e30526ca8343dfe80c2bd950847d22182953261c6c')
sha256sums_arm=('5f04f2892521761acae08495859c214f52fa96f437e9bcf32ce62b7b88f14622')
sha256sums_armv6h=('56880cca36fdcd10faa727c6da6b22548f12a220190147eff4a9736b574ab56c')
sha256sums_armv7h=('1c7ccef134941fff7e51df9b4ee3a7eefe9b53c73a2a15a419dfce1b10c65561')

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

    # Install Console files
    cp -R consoles/ \
        "${pkgdir}/etc/prometheus/consoles"

    cp -R console_libraries/ \
        "${pkgdir}/etc/prometheus/console_libraries"
}
