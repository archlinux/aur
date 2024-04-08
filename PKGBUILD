# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.51.1
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
sha256sums_x86_64=('1f933ea7515e3a6e60374ee0bfdb62bc4701c7b12c1dbafe1865c327c6e0e7d2')
sha256sums_arm=('b9ae366ebfdde572c634e7fede3d7f310ef8cbf3867449ca0f078ea62e760347')
sha256sums_armv6h=('3cf6cc353f7f45d82f4761f7b527507ba93fdaa4e13c08b92e47347b7061c46a')
sha256sums_armv7h=('c4dba2f1bf70aaed7ee455cc0828b0229a74ed85f8d6e5ce623798bdef10c130')
sha256sums_aarch64=('f281f674f2e7fb726a6066585197780f63bce8455a1773ec498b5be0c8732eb5')
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
