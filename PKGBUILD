# Maintainer: Rene Hollander <mail@renehollander.at>

pkgname=prometheus-exporter-exporter-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="A reverse proxy designed for Prometheus exporters."
arch=("x86_64")
url="https://github.com/QubitProducts/exporter_exporter"
license=("Apache2")

backup=('etc/conf.d/prometheus-exporter-exporter'
        'etc/prometheus-exporter-exporter.yml')

source=("https://github.com/QubitProducts/exporter_exporter/releases/download/v${pkgver}/exporter_exporter-${pkgver}.linux-amd64.tar.gz"
        prometheus-exporter-exporter.yml
        prometheus-exporter-exporter.conf
        prometheus-exporter-exporter.service)

sha512sums=('29a910130dfe50a35e6a5a55f6da2d61c61ef68036eab531228c27b9a7c507749dfe280826fdcf7ddd5197474560fca5e864e59ad566d5f8c081396b4d25596e'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    install -Dm644 prometheus-exporter-exporter.yml "$pkgdir"/etc/prometheus-exporter-exporter.yml
    install -Dm644 prometheus-exporter-exporter.conf "$pkgdir"/etc/conf.d/prometheus-exporter-exporter
    install -Dm644 prometheus-exporter-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-exporter-exporter.service

    cd "exporter_exporter-${pkgver}.linux-amd64"

    install -Dm755 "exporter_exporter" "$pkgdir"/usr/bin/prometheus-exporter-exporter
}
