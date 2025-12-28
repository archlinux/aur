# Maintainer: ZauJulio <zaujulio.dev@gmail.com>
pkgname=auto-throttle
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight thermal and power management orchestration for Linux"
arch=('x86_64')
url="https://github.com/ZauJulio/AutoThrottleSetup"
license=('MIT')
depends=('bash' 'bc')
optdepends=('ryzenadj: for AMD TDP control' 
            'turbostat: for monitoring' 
            'lm_sensors: for monitoring')
backup=('etc/auto-throttle.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
package() {
    cd "${srcdir}/AutoThrottleSetup-${pkgver}"
    sed -i 's|/usr/local/bin/auto-throttle|/usr/bin/auto-throttle|g' auto-throttle.service
    install -Dm755 "auto-throttle.sh" "${pkgdir}/usr/bin/auto-throttle"
    install -Dm644 "auto-throttle.conf" "${pkgdir}/etc/auto-throttle.conf"
    install -Dm644 "auto-throttle.service" "${pkgdir}/usr/lib/systemd/system/auto-throttle.service"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}