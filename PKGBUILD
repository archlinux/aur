# Maintainer: Amy <amy at fluff dot tech>

_distnum=2574
_distname="dist-chrome-${_distnum}.zip"

pkgname=bitwarden-chromium
pkgver=1.44.3
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
sha512sums=('f2bef42c62b1442e5563e35e3063543afb2c1bffc1436618adacad77925da4131d4af419dc66995c2fa680d6d4c6d323fe6592b5cb5f2ded0c13c263c07e7249')

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
