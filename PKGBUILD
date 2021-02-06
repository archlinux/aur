# Maintainer: Amy <amy at fluff dot tech>

_distnum=2874
_distname="dist-chrome-${_distnum}.zip"

pkgname=bitwarden-chromium
pkgver=1.48.1
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
sha512sums=('3895f6b9d5c63559dafaebfb82debbd8d850f24a52c6104b520bd3a5a481d3c7b6e912a834d8cbb48b4b63a068cb9a3d5a3c7fa18f5b67311b2d061b003c24ee')

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
