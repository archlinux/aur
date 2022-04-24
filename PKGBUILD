# Maintainer: Troy Hoover <troytjh98 at gmail dot com>

pkgname=pulseway-bin
pkgver=8.8.9
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
sha256sums_x86_64=('984bc8f7d638a32a4af72ecf1987844a719d372f9982b8523de33bd604e610fe')
sha256sums_i686=('9540d395dc7424308ddbd8b4d976f979a9ee567a1a474565c8f1d249b9bd9630')

_arch=$(uname -m)

package() {
    install -Dm644 "${srcdir}/etc/pulseway/config.xml.sample" "${pkgdir}/etc/pulseway/config.xml.sample"

    install -Dm644 "${srcdir}/usr/share/pulseway/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "${srcdir}/usr/bin/pulseway-registration" "${pkgdir}/usr/bin/pulseway-registration"
    install -Dm755 "${srcdir}/usr/bin/pulseway-update" "${pkgdir}/usr/bin/pulseway-update"
    install -Dm755 "${srcdir}/usr/bin/pulsewayd" "${pkgdir}/usr/bin/pulsewayd"

    install -dm755 "${pkgdir}/var/pulseway"
    install -Dm644 "${srcdir}/var/lib/pulseway/libcrypto.so.1.1" "${pkgdir}/var/lib/pulseway/libcrypto.so.1.1"
    install -Dm644 "${srcdir}/var/lib/pulseway/libssl.so.1.1" "${pkgdir}/var/lib/pulseway/libssl.so.1.1"

    install -Dm644 "${srcdir}/etc/systemd/system/pulseway.service" "${pkgdir}/usr/lib/systemd/system/pulseway.service"

    mkdir -p "${pkgdir}/etc/systemd/system"
    ln -s "/usr/lib/systemd/system/pulseway.service" "${pkgdir}/etc/systemd/system/pulseway.service"
}
