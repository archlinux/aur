# Maintainter: DXC-0 <thecyberarcher@protonmail.ch>
# Contributor: Amy <amy at fluff dot tech>

pkgname=bitwarden-chromium
pkgver=2025.6.1
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
sha256sums=('a638460f709b4daac6fb87a7b482378e8427da2ad6d420ba535ee652ad8fe6be')

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
