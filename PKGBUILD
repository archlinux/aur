# Maintainer: Amy <amy at fluff dot tech>

_distnum=3013
_distname="dist-chrome-${_distnum}.zip"

pkgname=bitwarden-chromium
pkgver=1.51.0
pkgrel=1
pkgdesc='Bitwarden Chromium extension'
arch=('any')
url='https://github.com/bitwarden/browser'
license=('GPL3')
makedepends=('git' 'unzip')
optdepends=('chromium' 'google-chrome')
install="${pkgname}.install"
source=("https://github.com/bitwarden/browser/releases/download/v${pkgver}/${_distname}")
noextract=("${_distname}")
sha512sums=('0b8612f02737f74b3dc3afa76eba4214a36734e15a6fa48c5554bf7d65ec9ba6e031da3e06685bb54bc2fd2f2afc3b31ed9c403c8eff35ed10ce8698e3d9dd65')

package() {
	# Extract files - bsdtar doesn't seem to handle it well
	cd "${srcdir}"
	unzip "${_distname}"
	rm "${_distname}"
	# Fix broken permissions
	chmod 755 $(find "${srcdir}" -type d)
	chmod 644 $(find "${srcdir}" -type f)
	# Copy files over to install dir
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	cp -dr --no-preserve=ownership "${srcdir}"/* "${pkgdir}/usr/share/${pkgname}/"
}
