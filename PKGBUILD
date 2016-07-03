# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-mysqld-exporter-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Prometheus exporter for MySQL server metrics (binary, not built from source)"
arch=('x86_64')
url="https://github.com/prometheus/mysqld_exporter"
license=('Apache')
depends=()
makedepends=()
backup=('etc/conf.d/prometheus-mysqld-exporter')
provides=('prometheus-mysqld-exporter')
conflicts=('prometheus-mysqld-exporter')
source=( 'prometheus-mysqld-exporter.service' 'prometheus-mysqld-exporter.confd'
"https://github.com/prometheus/mysqld_exporter/releases/download/${pkgver}/mysqld_exporter-${pkgver}.linux-amd64.tar.gz")
sha256sums=('de6e5047e91a1e18d98171d4fe45a037f5f48670501a0ca228a7502955ce2205'
            '5de90c46506c47d49fb98c41b6be09096fcc9a147c4d0304ac4a6bfb3974c165'
            '6a443d51b8d959168d4384df461942414c530b9ce15ddb303884e6ff4d53301a')

package() {
    cd "${srcdir}/mysqld_exporter-${pkgver}.linux-amd64"

    # Install Binary
    install -D -m0755 mysqld_exporter \
        "${pkgdir}/usr/bin/prometheus_mysqld_exporter"

    # Install Daemon Configuration
    install -D -m0644 "${srcdir}/prometheus-mysqld-exporter.confd" \
        "${pkgdir}/etc/conf.d/prometheus-mysqld-exporter"

    # Install SystemD Service File
    install -D -m0755 "${srcdir}/prometheus-mysqld-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus-mysqld-exporter.service"
}
