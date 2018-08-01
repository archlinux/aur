# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.3.2
pkgrel=3
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
sha256sums_x86_64=('351931fe9bb252849b7d37183099047fbe6d7b79dcba013fb6ae19cc1bbd8552')
sha256sums_arm=('f4afa945058587ba344eaf2eef6728b3777b55399d2334290df11254b4769d59')
sha256sums_armv6h=('85e5a0e16d27b9e642d1d4886d2283c9df6b5b7d68f06b4d866be93406224b20')
sha256sums_armv7h=('c21033b9d3a4ddc22620226bc5569987f3d47d115ec8d847a99f0c6255da5ddb')

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
