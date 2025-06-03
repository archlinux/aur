# Maintainer: Alessandro Bernardello
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=ente-auth-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://ente.io/auth"
license=('AGPL-3.0-or-later')
depends=(
	'libayatana-appindicator'
	'libsecret'
	'libsodium-1.0.18'
	'org.freedesktop.secrets'
	'xdg-user-dirs'
)
optdepends=(
	# https://github.com/ente-io/ente/issues/4414
	'zenity: Required for importing files'
)
install=${pkgname}.install
source_x86_64=("https://github.com/ente-io/ente/releases/download/auth-v${pkgver}/ente-auth-v${pkgver}-x86_64.deb")
sha256sums_x86_64=('d45a1c0ce4a9137ffb0d16c45171d50b56de663855ac1cebcaebfe677e7e1934')
provides=("ente-auth")
conflicts=("ente-auth")

package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}/"
	install -d "${pkgdir}/usr/bin"
	ln -s /usr/share/enteauth/enteauth "${pkgdir}/usr/bin/enteauth"
}
