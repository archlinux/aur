# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.5.0
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
sha256sums_x86_64=('6f1203c3ec540346bb346641eb43a74fde2992cda23b6c9e0f876f95a646cda1')
sha256sums_arm=('a2830b9e4a1e69a7d9a9dbb43ac15fab10d921ebde2e88fbc18c91d0096f14f2')
sha256sums_armv6h=('36c34acf26e2a7273f4a8a05deae1f590f15f2019fb38b5114233c1160d38cbf')
sha256sums_armv7h=('bb6e776d908af4f5905259ddbc61d41bb43369414e537d28c8378e8e3484bc3c')

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
