# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=alertmanager-bin
pkgver=0.30.0
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
sha256sums_x86_64=('86fd95034e3e17094d6951118c54b396200be22a1c16af787e1f7129ebce8f1f')
sha256sums_arm=('8752610f8e824ee236d5b572362c792f704c5db8de8b9f334a02b02bcda50aaf')
sha256sums_armv6h=('d112ed9a978d099e5774cc41353880fc881ce8ad5b5bcb8376c05c26f5da71f1')
sha256sums_armv7h=('0bc19b50dd78452be2b744a67c5a8d08cd7d7411ec7f65e8c6ff1dcef7ab59f7')
sha256sums_aarch64=('061a5ab3998fb8af75192980a559c7bfa3892da55098da839d7a79d94abe0b61')

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
