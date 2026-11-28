# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Alessandro Bernardello <aleberna at erine dot eu>

pkgname=ente-auth-bin
pkgver=4.4.27
pkgrel=1
pkgdesc="Open source 2FA authenticator, with end-to-end encrypted backups"
arch=('x86_64')
url="https://ente.com/auth"
license=('AGPL-3.0-or-later')
options=('!debug')
depends=(
	'ayatana-ido'
	'libayatana-appindicator'
	'libayatana-indicator'
	'libsecret'
	'org.freedesktop.secrets'
	'polkit'
	'sqlite'
	'xdg-user-dirs'
)
source=("https://github.com/ente/ente/releases/download/auth-v${pkgver}/ente-auth-v${pkgver}-${CARCH}.deb")
sha256sums=('252800cc91404de982a00b6174a8f79da3380754c7aba482544329f4d90edde2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}/"
	install -d "${pkgdir}/usr/bin"
	ln -s /usr/share/enteauth/enteauth "${pkgdir}/usr/bin/enteauth"
	install -d "${pkgdir}/usr/share/polkit-1/actions"
	ln -s /usr/share/enteauth/data/flutter_assets/assets/polkit/com.ente.auth.policy \
	"${pkgdir}/usr/share/polkit-1/actions/"
}
