# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=alertmanager-bin
pkgver=0.4.2
pkgrel=1
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
sha256sums=('1814c0af761906ef037971cafe32a3109b29df1c191583b77d0e6d0f63ec2ed7'
            '8d04e3dc9955a0a3897d126c996b921cfd1dc80ff6ff982936ce8f703baa2eb8')

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
