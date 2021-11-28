# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.31.1
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
sha256sums_x86_64=('7852dc11cfaa039577c1804fe6f082a07c5eb06be50babcffe29214aedf318b3')
sha256sums_arm=('58e4ac69a6d47dff3629acd5420c6d44dae400f1c6eed80981ab8343661e8f83')
sha256sums_armv6h=('4f761f74cdae3e0ce4c333978fd0489e608a0ef84b895753cee6a90a0b2013b3')
sha256sums_armv7h=('623a93e9999e4c76fe866c1274c1923ebeab26c017081f9dccbcdb1d3b9ef623')
sha256sums_aarch64=('a7b4694b96cbf38b63ca92d05a6d3a2cf6df50a85a4d2a3fe2d758a65dcbec3b')
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
