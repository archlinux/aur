# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-mysqld-exporter-bin
pkgver=0.12.1
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
"https://github.com/prometheus/mysqld_exporter/releases/download/v${pkgver}/mysqld_exporter-${pkgver}.linux-amd64.tar.gz")
sha256sums=('d8939e5f53ea847c177b65d5748c614a53f068076dfdea564773ec2f2193a1c7'
            '5de90c46506c47d49fb98c41b6be09096fcc9a147c4d0304ac4a6bfb3974c165'
            '133b0c281e5c6f8a34076b69ade64ab6cac7298507d35b96808234c4aa26b351')

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
