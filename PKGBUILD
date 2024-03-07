# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=alertmanager-bin
pkgver=0.27.0
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
sha256sums_x86_64=('23c3f5a3c73de91dbaec419f3c492bef636deb02680808e5d842e6553aa16074')
sha256sums_arm=('4be93d653c6ea20c8a92a4a568aa4044e727c57d1b91ccb6d6842ce01201f0e3')
sha256sums_armv6h=('d1ce28268853e2e316645b5610756088485c38ef7accbc2a6959ad337f0169fc')
sha256sums_armv7h=('76b1f4ea8ae769604b1c5ba2b5a24d4f3abe19f06837b69886a597c04b56cef9')
sha256sums_aarch64=('a754304b682cec61f4bd5cfc029b451a30134554b3a2f21a9c487e12814ff8f3')

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
