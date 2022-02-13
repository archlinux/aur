# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='systemctl-policy'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='Run pkexec systemctl [start|stop] without password confirmation'
url='https://github.com/hardpixel/systemd-manager/'
arch=('any')
license=('GPL3')
depends=('polkit')
optdepends=('gnome-shell-extension-systemd-manager: for launching systemd services from the GNOME Shell')
source=('10-service_status.rules'
        'org.freedesktop.policykit.pkexec.systemctl.policy')
sha256sums=('3c6861e6fc06dc3e40566eef3ccd631f16852e57aea873aa330f9f1fcbdd6cac'
            '9fb27d6bf6eb1dedbacabd82baebcf388213e0d2d2e3e94b436e6a3f40729fcc')

package() {
	install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
	install -Dm644 "${srcdir}/org.freedesktop.policykit.pkexec.systemctl.policy" \
		"${pkgdir}/usr/share/polkit-1/actions/org.freedesktop.policykit.pkexec.systemctl.policy"

	install -dm750 "${pkgdir}/usr/share/polkit-1/rules.d"
	install -Dm644 "${srcdir}/10-service_status.rules" \
		"${pkgdir}/usr/share/polkit-1/rules.d/10-service_status.rules"
}

