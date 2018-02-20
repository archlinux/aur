# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=alertmanager-bin
pkgver=0.14.0
pkgrel=2
pkgdesc="Alertmanager handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integration (binary, not built from source)"
arch=('x86_64')
url="https://github.com/prometheus/alertmanager"
license=('Apache')
depends=()
makedepends=()
provides=('alertmanager')
conflicts=('alertmanager')
backup=('etc/alertmanager/alertmanager.yml')
source=( 'alertmanager.service'
"https://github.com/prometheus/alertmanager/releases/download/v${pkgver}/alertmanager-${pkgver}.linux-amd64.tar.gz")
sha256sums=('e70ba553dc0c632106c6424e9bad70324d54e10837e8183ca16c8dd53c804199'
            'caddbbbe3ef8545c6cefb32f9a11207ae18dcc788e8d0fb19659d88c58d14b37')

package() {
    cd "${srcdir}/alertmanager-${pkgver}.linux-amd64/"

    # Install Binary
    install -D -m0755 alertmanager \
        "${pkgdir}/usr/bin/alertmanager"

    # Install Config File
    install -D -m0755 simple.yml \
        "${pkgdir}/etc/alertmanager/alertmanager.yml"

    # Create Notifications Template Directory
    install -d -m0755 "${pkgdir}/etc/alertmanager/template/"

    # Install SystemD Service File
    install -D -m0755 "${srcdir}/alertmanager.service" \
        "${pkgdir}/usr/lib/systemd/system/alertmanager.service"
}
