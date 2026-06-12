# Maintainer: Alessandro Bernardello
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=ente-auth-bin
pkgver=4.4.23
pkgrel=1
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://ente.io/auth"
license=('AGPL-3.0-or-later')
depends=(
	'libayatana-appindicator'
	'libsecret'
	'org.freedesktop.secrets'
	'xdg-user-dirs'
)
optdepends=(
	# https://github.com/ente-io/ente/issues/4414
	'zenity: Required for importing files'
)
source=("https://github.com/ente-io/ente/releases/download/auth-v${pkgver}/ente-auth-v${pkgver}-${CARCH}.deb")
sha256sums=('6b71cbacb18139da458aac3515d276014cdca881caf83eb1fc82fe7df9faa592')
provides=("ente-auth")
conflicts=("ente-auth")

package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}/"
	install -d "${pkgdir}/usr/bin"
	ln -s /usr/share/enteauth/enteauth "${pkgdir}/usr/bin/enteauth"
}
