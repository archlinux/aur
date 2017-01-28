# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-haproxy-exporter-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Simple server that scrapes HAProxy stats and exports them via HTTP for Prometheus consumption (binary, not built from source)"
arch=('x86_64')
url="https://github.com/prometheus/haproxy_exporter"
license=('Apache')
depends=()
makedepends=()
backup=('etc/conf.d/prometheus-haproxy-exporter')
provides=('prometheus-haproxy-exporter')
conflicts=('prometheus-haproxy-exporter')
source=( 'prometheus-haproxy-exporter.service' 'prometheus-haproxy-exporter.confd'
"https://github.com/prometheus/haproxy_exporter/releases/download/v${pkgver}/haproxy_exporter-${pkgver}.linux-amd64.tar.gz")
sha256sums=('59d6753ca5cff752304a7391de336443cd7394bae6095c5986a07c4e431efe4f'
            '7b363fa314f1ab2630ea5dbc4a888c5b7b2b0472a474a745bd8a55d385e5a568'
            '25426aafa337e717e04af1d0de15ea8848a63342a609019a539df3e937699f1a')

package() {
    cd "${srcdir}/haproxy_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 haproxy_exporter \
        "${pkgdir}/usr/bin/prometheus_haproxy_exporter"

    # Install Daemon Configuration
    install -D -m0644 "${srcdir}/prometheus-haproxy-exporter.confd" \
        "${pkgdir}/etc/conf.d/prometheus-haproxy-exporter"

    # Install SystemD Service File
    install -D -m0755 "${srcdir}/prometheus-haproxy-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus-haproxy-exporter.service"
}
