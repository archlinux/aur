# Maintainer: Your Name <your.email@example.com>
pkgname=fnq-monitor
pkgver=1.0.0
pkgrel=5
pkgdesc="Monitor Fn+Q ACPI events for system performance modes"
arch=('any')
url="https://github.com/outvoker678/fnq-monitor"
license=('GPL3')
depends=('acpi_call' 'acpid' 'qt5-tools' 'polkit' 'breeze-icons')
makedepends=('git')
backup=('etc/polkit-1/rules.d/49-fnq-monitor.rules')
install='fnq-monitor.install'
source=('fnq-monitor.sh'
        'fnq-monitor.service'
        '49-fnq-monitor.rules'
        'acpi_call-rebuild-initramfs.hook'
        'README.md')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    # Install main script
    install -Dm755 "${srcdir}/fnq-monitor.sh" "${pkgdir}/usr/bin/fnq-monitor"

    # Install systemd user service in /etc/systemd/user/ for global activation
    install -Dm644 "${srcdir}/fnq-monitor.service" "${pkgdir}/etc/systemd/user/fnq-monitor.service"

    # Install polkit rules
    install -Dm644 "${srcdir}/49-fnq-monitor.rules" "${pkgdir}/etc/polkit-1/rules.d/49-fnq-monitor.rules"

    # Install pacman hook
    install -Dm644 "${srcdir}/acpi_call-rebuild-initramfs.hook" "${pkgdir}/usr/lib/pacman/hooks/acpi_call-rebuild-initramfs.hook"

    # Install README
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
