# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=alertmanager-bin
pkgver=0.26.0
pkgrel=1
pkgdesc="Alertmanager handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integration (binary, not built from source)"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/prometheus/alertmanager"
license=('Apache')
depends=()
makedepends=()
provides=('alertmanager')
conflicts=('alertmanager')
backup=('etc/alertmanager/alertmanager.yml')
source=('alertmanager.service')
source_x86_64=("https://github.com/prometheus/alertmanager/releases/download/v${pkgver}/alertmanager-${pkgver}.linux-amd64.tar.gz")
source_arm=("https://github.com/prometheus/alertmanager/releases/download/v${pkgver}/alertmanager-${pkgver}.linux-armv5.tar.gz")
source_armv6h=("https://github.com/prometheus/alertmanager/releases/download/v${pkgver}/alertmanager-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("https://github.com/prometheus/alertmanager/releases/download/v${pkgver}/alertmanager-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("https://github.com/prometheus/alertmanager/releases/download/v${pkgver}/alertmanager-${pkgver}.linux-arm64.tar.gz")
sha256sums=('e70ba553dc0c632106c6424e9bad70324d54e10837e8183ca16c8dd53c804199')
sha256sums_x86_64=('abd73e2ee6bf67d3888699660abbecba7b076bf1f9459a3a8999d493b149ffa6')
sha256sums_arm=('f7f5dc4b2c5edbb5d12c16076dcba3c1d60395ef061a0a229e08661a39784abf')
sha256sums_armv6h=('dedb691e494d7670b78728d70ded8e78d4f1fea1c00d384a793ad6040c6af853')
sha256sums_armv7h=('1a88a94c1f6cce900f49daba6142a5900afc92619ce98864663338d74bcf1685')
sha256sums_aarch64=('f65969661821570929ad34cf64e034fe72c8e014855d244321c67a0c3ce3fc08')

package() {
    case "$CARCH" in
        'x86_64') ARCH='amd64';;
        'arm') ARCH='armv5';;
        'armv6h') ARCH='armv6';;
        'armv7h') ARCH='armv7';;
        'aarch64') ARCH='arm64';;
    esac
    cd "${srcdir}/alertmanager-${pkgver}.linux-${ARCH}"

    # Install Binary
    install -D -m0755 alertmanager \
        "${pkgdir}/usr/bin/alertmanager"

    # Install Amtool Binary
    install -D -m0755 amtool \
        "${pkgdir}/usr/bin/amtool"

    # Install Config File
    install -D -m0755 alertmanager.yml \
        "${pkgdir}/etc/alertmanager/alertmanager.yml"

    # Create Notifications Template Directory
    install -d -m0755 "${pkgdir}/etc/alertmanager/template/"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/alertmanager.service" \
        "${pkgdir}/usr/lib/systemd/system/alertmanager.service"
}
