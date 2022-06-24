# Maintainer: Mathieu Clabaut <mathieu[at]clabaut.net>

pkgname=prometheus-blackbox-exporter-bin
pkgver=0.21.1
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
sha256sums_x86_64=('a849ded3bee31f676b13fd0bcc9264ff577a31ab4b3fb23c34e64767588ef857'
                   '38d9cf33beabc7bcf2a2504c2657ecee66a96da94a4f829619e92980800da3ce'
                   '17e5b3850058fd95e07b2d5d96d4869436ff475f190c731b11d6cf6914c7c9f3'
                   '1ccc0cb5bcd94c5b6cafe795f7bdcc411c4bcc2ef8bd84a7683a604136c609e4'
                   '0c4a2c3321234cca1b39cd063fbeec6283c030af875281ff68be3c04633a8386')
sha256sums_armv5h=('a849ded3bee31f676b13fd0bcc9264ff577a31ab4b3fb23c34e64767588ef857'
                   '38d9cf33beabc7bcf2a2504c2657ecee66a96da94a4f829619e92980800da3ce'
                   '17e5b3850058fd95e07b2d5d96d4869436ff475f190c731b11d6cf6914c7c9f3'
                   '1ccc0cb5bcd94c5b6cafe795f7bdcc411c4bcc2ef8bd84a7683a604136c609e4'
                   'd577373457d59e2068f699b690db98e3137efede16dc00fdaaf165a0df397d37')
sha256sums_armv6h=('a849ded3bee31f676b13fd0bcc9264ff577a31ab4b3fb23c34e64767588ef857'
                   '38d9cf33beabc7bcf2a2504c2657ecee66a96da94a4f829619e92980800da3ce'
                   '17e5b3850058fd95e07b2d5d96d4869436ff475f190c731b11d6cf6914c7c9f3'
                   '1ccc0cb5bcd94c5b6cafe795f7bdcc411c4bcc2ef8bd84a7683a604136c609e4'
                   'eda8b420697ba80b36db12d80a75a1645ee78c2f0af34f4d9d0399520402a3af')
sha256sums_armv7h=('a849ded3bee31f676b13fd0bcc9264ff577a31ab4b3fb23c34e64767588ef857'
                   '38d9cf33beabc7bcf2a2504c2657ecee66a96da94a4f829619e92980800da3ce'
                   '17e5b3850058fd95e07b2d5d96d4869436ff475f190c731b11d6cf6914c7c9f3'
                   '1ccc0cb5bcd94c5b6cafe795f7bdcc411c4bcc2ef8bd84a7683a604136c609e4'
                   'daea29cf506a9a2e8593a576743f3cdf3f438753ca82a9cd9b8d2141a31d0b41')
