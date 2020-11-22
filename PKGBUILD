# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.22.2
pkgrel=1
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
sha256sums_x86_64=('acd3189c3f09b3857b6635df327814633939be07d12c4eea8f78c94fe9fd115c')
sha256sums_arm=('ebc8c11a6b61f9f5a6fdbedce688c9b90fcd6f750c6ad3d745dfdb9ed66f9701')
sha256sums_armv6h=('d60c34afaaa8a9e396ac3deae18281a414b2c5511ab01e4820a7d8ac4b29e88f')
sha256sums_armv7h=('87dba8189c28bb064f48e088820e132f9ec0bcea422e6272aabdf8aea647cc08')
sha256sums_aarch64=('f54ce0122b68333649565e585893ca344f773e233e36be5db1114201373e352a')
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

    # Install Console files
    cp -R consoles/ \
        "${pkgdir}/etc/prometheus/consoles"

    cp -R console_libraries/ \
        "${pkgdir}/etc/prometheus/console_libraries"
}
