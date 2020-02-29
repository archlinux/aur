# Maintainer: Slashbunny <demodevil5[at]yahoo>

pkgname=prometheus-bin
pkgver=2.16.0
pkgrel=1
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
sha256sums=('0c99b68b282d72feb9fd2bc0b190554659a59dada74ec92ca2b2f48016a9b805')
sha256sums_x86_64=('c04e631d18e186b66a51cac3062157298e037ffae784f35ccaaf29e496d65d3f')
sha256sums_arm=('bca4a0221045948659eab36f702d02494103414a13fad7ec39e4f645084ded63')
sha256sums_armv6h=('35a68da888e4b94bfbb25a4287a16710b352806042754171add78e33c2d30988')
sha256sums_armv7h=('2ce8f9a0b0a82ffd65ffeaa1b48fa55c8f7b30969c479685cc8f3107d2be9875')
sha256sums=('0c99b68b282d72feb9fd2bc0b190554659a59dada74ec92ca2b2f48016a9b805')
sha256sums_x86_64=('1c2175428e7a70297d97a30a04278b86ccd6fc53bf481344936d6573482203b4')
sha256sums_arm=('31ec0f2cb070d91e2dbe7ecc6c5f1051b28f6792fd7b5ae3c8a127ff90097584')
sha256sums_armv6h=('c16b654cb7cfb9919da62b791759561e10b6d9d9271e1160f11d045cb29f5473')
sha256sums_armv7h=('795ec7349828166d9fdf78f7c53b35d04488929fae26f9e547459f60dc34c060')

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
