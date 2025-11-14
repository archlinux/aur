# Maintainer: Alessandro Bernardello
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=ente-auth-bin
pkgver=4.4.10
pkgrel=2
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
sha256sums=('bc9d20ecf747660f986801c88235e1755410ec2ca0760e6f6b138b3ddf8fd10e')
provides=("ente-auth")
conflicts=("ente-auth")

package() {
	bsdtar -xf data.tar.zst -C "${pkgdir}/"
	install -d "${pkgdir}/usr/bin"
	ln -s /usr/share/enteauth/enteauth "${pkgdir}/usr/bin/enteauth"

	# add StartupWMClass to desktop file
	desktop-file-edit --set-key=StartupWMClass --set-value=io.ente.auth "$pkgdir/usr/share/applications/enteauth.desktop"
}
