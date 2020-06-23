# Maintainer: Mathieu Clabaut <mathieu[at]clabaut.net>

pkgname=prometheus-blackbox-exporter-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Prometheus blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP (binary, not built from source)."
arch=('x86_64' 'armv5h' 'armv6h' 'armv7h')
url="https://github.com/prometheus/blackbox_exporter"
license=('Apache')
depends=()
makedepends=()
install='prometheus-blackbox-exporter.install'
backup=('etc/prometheus/blackbox.yml')
provides=('prometheus-blackbox-exporter')
conflicts=('prometheus-blackbox-exporter')
source_x86_64=( 'prometheus-blackbox-exporter.service' 'config.yml'
'prometheus-blackbox-exporter.install' 'prometheus.sysusers'
"https://github.com/prometheus/blackbox_exporter/releases/download/v${pkgver}/blackbox_exporter-${pkgver}.linux-amd64.tar.gz")
source_armv5h=( 'prometheus-blackbox-exporter.service' 'config.yml'
'prometheus-blackbox-exporter.install' 'prometheus.sysusers'
"https://github.com/prometheus/blackbox_exporter/releases/download/v${pkgver}/blackbox_exporter-${pkgver}.linux-armv5.tar.gz")
source_armv6h=( 'prometheus-blackbox-exporter.service' 'config.yml'
'prometheus-blackbox-exporter.install' 'prometheus.sysusers'
"https://github.com/prometheus/blackbox_exporter/releases/download/v${pkgver}/blackbox_exporter-${pkgver}.linux-armv6.tar.gz")
source_armv7h=( 'prometheus-blackbox-exporter.service' 'config.yml'
'prometheus-blackbox-exporter.install' 'prometheus.sysusers'
"https://github.com/prometheus/blackbox_exporter/releases/download/v${pkgver}/blackbox_exporter-${pkgver}.linux-armv7.tar.gz")


package() {
       case "$CARCH" in
            'x86_64') ARCH='amd64';;
            'armv5h') ARCH='armv5';;
            'armv6h') ARCH='armv6';;
            'armv7h') ARCH='armv7';;
    esac

    cd "${srcdir}/blackbox_exporter-${pkgver}.linux-${ARCH}"

    # Install Binary
    install -D -m0755 blackbox_exporter \
        "${pkgdir}/usr/bin/prometheus_blackbox_exporter"

    install -dm755 "$pkgdir"/usr/lib/systemd/system
    install -dm755 "$pkgdir"/usr/lib/sysusers.d
    install -m644 "$srcdir"/prometheus.sysusers "$pkgdir"/usr/lib/sysusers.d/prometheus-blackbox.conf


    # Install SystemD Service File
    install -D -m0644 "${srcdir}/prometheus-blackbox-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus-blackbox-exporter.service"
    #Install example configuration
    install -D -m0644 "${srcdir}/config.yml" \
        "${pkgdir}/etc/prometheus/blackbox.yml"
}
md5sums_x86_64=('e92e48a4199046fdd92ad21eba658b8f'
                '81d90a7cdaadf99c5aa1399864dcf3da'
                '45cf951d67cf59d74be82d0ddcce704d'
                '15acae9345cc6032933e54c0cf1cbc35'
                '9a5ad0cc47bfc1d8aebefa2bbc1cd8ce')
md5sums_armv5h=('e92e48a4199046fdd92ad21eba658b8f'
                '81d90a7cdaadf99c5aa1399864dcf3da'
                '45cf951d67cf59d74be82d0ddcce704d'
                '15acae9345cc6032933e54c0cf1cbc35'
                'd12a76d088472a162e9a482fafa2613c')
md5sums_armv6h=('e92e48a4199046fdd92ad21eba658b8f'
                '81d90a7cdaadf99c5aa1399864dcf3da'
                '45cf951d67cf59d74be82d0ddcce704d'
                '15acae9345cc6032933e54c0cf1cbc35'
                '1dfe09e66c3d7db217c9c7b27ec7b16a')
md5sums_armv7h=('e92e48a4199046fdd92ad21eba658b8f'
                '81d90a7cdaadf99c5aa1399864dcf3da'
                '45cf951d67cf59d74be82d0ddcce704d'
                '15acae9345cc6032933e54c0cf1cbc35'
                'f921883a84f2394b070d53ba15514fb3')
