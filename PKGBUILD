# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=alertmanager-bin
pkgver=0.15.3
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
sha256sums_x86_64=('b43fd8aba978f19375e37fb7924bcdc7dd45659b1b0f87a2815860001f100f46')
sha256sums_arm=('ad352df30d167a3b1713843dbbb086afddb78f92697ed97356b88302ca4b1efb')
sha256sums_armv6h=('ce35550cc993267b7c139f7055dd96504cb072caf92dd6d2d0282927f2cc5f47')
sha256sums_armv7h=('195128e97afef09d83cc3d1f4d76ab7a4e73181fc427e852fcaa5c19baf8072f')
sha256sums_aarch64=('e92ec589c1c4e077a083d9d874d39eb7cab45dd379fbd023ad6b7495d084089f')

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
