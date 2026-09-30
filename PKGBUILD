# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=alertmanager-bin
pkgver=0.34.1
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
sha256sums_x86_64=('265b9d1e55ef0d5306a436018af6d2b686c2ce051f03d968f7464ecb1372a7e8')
sha256sums_arm=('9374a8bc4f114b1204a507329ccd75e2dad715d7cee82c03259d40052037d372')
sha256sums_armv6h=('7b2727f1c33c6c63045985957322a0476ae47dfdd84da05b609f6d54106e6075')
sha256sums_armv7h=('75f568dc43b3f905cc846e71417bbcc1d63d186bc7d95bd87fd2f41b1124d4f3')
sha256sums_aarch64=('d98d6cbaf52151c7e76e24355fec88b11cebcb9875d4cdd8b76ddce7a7e5535c')

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
