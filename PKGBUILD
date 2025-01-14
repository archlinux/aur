# Maintainer: Mathieu Clabaut <mathieu[at]clabaut.net>

pkgname=prometheus-process-exporter-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="Prometheus exporter that mines /proc to report on selected processes"

arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/ncabatoff/process-exporter"
license=('Apache')
depends=()
makedepends=()
backup=('etc/prometheus/process.yml')
provides=('prometheus-process-exporter')
conflicts=('prometheus-process-exporter')
source=( 'process-exporter.service' 'process.yml' )
source_x86_64=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-armv7.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-armv6.tar.gz")
source_arm=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-armv6.tar.gz")

package() {
	case "$CARCH" in
		'x86_64') ARCH='amd64';;
		'arm') ARCH='armv6';;
		'armv6h') ARCH='armv6';;
		'armv7h') ARCH='armv7';;
		'aarch64') ARCH='arm64';;
    esac
    cd "${srcdir}/process-exporter-${pkgver}.linux-${ARCH}"

    # Install Binary
    install -D -m0755 process-exporter \
        "${pkgdir}/usr/bin/process-exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/process-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/process-exporter.service"
    #Install example configuration
    install -D -m0644 "${srcdir}/process.yml" \
        "${pkgdir}/etc/prometheus/process.yml"
}
sha256sums=('70a8611709a0ec52f7157d9488f1e6632fa5ff360871c2591407b3604da21eb4'
            '5473359eb2eb8c17698a5c3d3c9e1836f74a1fdc83c3b6a45c9869920919abe1')
sha256sums_x86_64=('30b20325adc4542cf1a3bba85c1135921b7a07b39061bcab298a498b4737aeda')
sha256sums_aarch64=('8792c2453c52c521846caca382acb940b96e0c09777fee349dae340ac66362ad')
sha256sums_armv7h=('b7f362eb987a7af90c276bf8fef8df4020b7285a9594e7975ebb61f1343a1736')
sha256sums_armv6h=('bfbd73ff67980d45294b57a726972a02654fd913b4796baa3ab990c96084c5ec')
sha256sums_arm=('bfbd73ff67980d45294b57a726972a02654fd913b4796baa3ab990c96084c5ec')
