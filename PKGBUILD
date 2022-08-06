# Maintainer: Troy Hoover <troytjh98 at gmail dot com>

pkgname=pulseway-bin
pkgver=8.11
pkgrel=1
pkgdesc="Pulseway (Remotely Monitor and Control IT Systems)"
arch=('x86_64' 'i686')
url="https://www.pulseway.com/"
options=('!strip')
license=('custom')
depends=(
    'ca-certificates'
    'wget'
)
install="pulseway-bin.install"

source_x86_64=("https://www.pulseway.com/download/pulseway_x64.pkg.tar.xz")
source_i686=("https://www.pulseway.com/download/pulseway_x86.pkg.tar.xz")
sha256sums_x86_64=('518973a430e705325bac98ef501d9aa78d6b96c22ac413cac290d42a322e3b6a')
sha256sums_i686=('7767dc89328d06c25c66cff9ea17771e4bf6587a48351e59d980cce1bdd5f326')

_arch=$(uname -m)

package() {
    install -Dm644 "${srcdir}/etc/pulseway/config.xml.sample" "${pkgdir}/etc/pulseway/config.xml.sample"

    install -Dm644 "${srcdir}/usr/share/pulseway/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "${srcdir}/usr/bin/pulseway-registration" "${pkgdir}/usr/bin/pulseway-registration"
    install -Dm755 "${srcdir}/usr/bin/pulseway-update" "${pkgdir}/usr/bin/pulseway-update"
    install -Dm755 "${srcdir}/usr/bin/pulsewayd" "${pkgdir}/usr/bin/pulsewayd"

    install -dm755 "${pkgdir}/var/pulseway"

    install -Dm644 "${srcdir}/etc/systemd/system/pulseway.service" "${pkgdir}/usr/lib/systemd/system/pulseway.service"
}
