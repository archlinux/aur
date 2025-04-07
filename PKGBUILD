# Maintainter: TheCyberArcher <thecyberarcher@protonmail.ch>
# Contributor: Amy <amy at fluff dot tech>

pkgname=bitwarden-chromium
pkgver=2025.3.2
pkgrel=1
pkgdesc='Bitwarden Chromium extension'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL-3.0-only')
makedepends=('git' 'unzip')
optdepends=('chromium' 'google-chrome')
install="${pkgname}.install"
source=("${url}/releases/download/browser-v${pkgver}/dist-chrome-${pkgver}.zip")
noextract=("dist-chrome-${pkgver}.zip")
sha256sums=('3fd818d978eb3d99e78c432ad8cfcaa5b9e0e4473b80b4631a10aa5be5f840b5')

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
