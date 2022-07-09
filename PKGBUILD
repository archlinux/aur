# Maintainer: Amy <amy at fluff dot tech>

pkgname=bitwarden-chromium
pkgver=2022.6.1
pkgrel=1
pkgdesc='Bitwarden Chromium extension'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL3')
makedepends=('git' 'unzip')
optdepends=('chromium' 'google-chrome')
install="${pkgname}.install"
source=("${url}/releases/download/browser-v${pkgver}/dist-chrome-${pkgver}.zip")
noextract=("dist-chrome-${pkgver}.zip")
sha512sums=('79f845c952494db7c1fdf4c99a7804bc88d60a4a01b2ef7f541505d2eb51eec3c55bfa5dbfd041a1ad2c5480999e1a52e4aeada57d5fce18f58df1cbe02f08ee')

package() {
	# Extract files - bsdtar doesn't seem to handle it well
	cd "${srcdir}"
	unzip "dist-chrome-${pkgver}.zip"
	rm "dist-chrome-${pkgver}.zip"
	# Fix broken permissions
	chmod 755 $(find "${srcdir}" -type d)
	chmod 644 $(find "${srcdir}" -type f)
	# Copy files over to install dir
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	cp -dr --no-preserve=ownership "${srcdir}"/* "${pkgdir}/usr/share/${pkgname}/"
}
