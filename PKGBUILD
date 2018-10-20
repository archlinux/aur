# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.4.3
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
sha256sums_x86_64=('3aa063498ab3b4d1bee103d80098ba33d02b3fed63cb46e47e1d16290356db8a')
sha256sums_arm=('ceb8f4849ce82fe444c9177cb00975aeca23142e97b588da79f287f71f8756f4')
sha256sums_armv6h=('c8405cc997f4b98843a4ac2c5a2c17fcfdb0a836c4d1962d7b885784560940b6')
sha256sums_armv7h=('3d73acbd66c1e99e453e2eca8da265ed8a8c7a655c2b344cbc1747fdb030a508')

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
