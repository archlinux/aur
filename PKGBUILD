# Maintainer: Amy <amy at fluff dot tech>

pkgname=bitwarden-chromium
pkgver=2023.2.1
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
sha512sums=('4ddccb9adfb3fcca80ddc10ad634d685ee8715d3daf94b86d764fcce26c19c2ac33c8164e1607b69c9e164ebc975b49df5518be10f3401df38c6bddb6b3f1d91')

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
