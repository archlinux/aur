# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.33.1
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
sha256sums_x86_64=('55de29727fc4d3977d3400c54fa222ebb52755bd0201936f1e1052fea6f2b44b')
sha256sums_arm=('bc51a6073ac1d90c8ebd548694baeb8c6dff91945cf00b763c65a11412b7f945')
sha256sums_armv6h=('16769a890ce803f571a5c68689dd9c6401a9d80e491352eaefd5eeff6441e460')
sha256sums_armv7h=('09e285f098c36a5f2e7cf065fb38bd8f65ef262aeda728aac48b8cbb40ef34cc')
sha256sums_aarch64=('21d89df7a98882a1a872bd3210aeaac3915a7f7be9f2ad28c986c80ad64ee77d')
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
