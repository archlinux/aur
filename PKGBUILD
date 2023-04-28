# Maintainer: Amy <amy at fluff dot tech>

pkgname=bitwarden-chromium
pkgver=2023.4.0
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
sha512sums=('dbc08cc84d6a479bc942f95717d7c170e3c74b52fe7603eaadc74719e65aa90f1bad2ee457165c91d6cf5b6412140870552e80aa4eac366ddeb4735b5e46707f')

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
