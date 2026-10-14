# Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=ente-auth-bin
pkgver=4.4.25
pkgrel=1
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://ente.io/auth"
license=('AGPL-3.0-or-later')
options=('!debug')
depends=(
	'libayatana-appindicator'
	'libsecret'
	'org.freedesktop.secrets'
	'xdg-user-dirs'
	'polkit'
	'ayatana-ido'
	'libayatana-indicator'
)
optdepends=()
source=("https://github.com/ente-io/ente/releases/download/auth-v${pkgver}/ente-auth-v${pkgver}-${CARCH}.deb")
sha256sums=('00ff315f040ee69dd1100d74ecf4ddf0fabd246c796d17c6170dc84172ca38af')
provides=("ente-auth")
conflicts=("ente-auth")

package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}/"
	install -d "${pkgdir}/usr/bin"
	ln -s /usr/share/enteauth/enteauth "${pkgdir}/usr/bin/enteauth"
	install -d "${pkgdir}/usr/share/polkit-1/actions"
  	ln -s /usr/share/enteauth/data/flutter_assets/assets/polkit/com.ente.auth.policy \
    	"${pkgdir}/usr/share/polkit-1/actions/"
}
