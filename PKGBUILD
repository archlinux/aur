# Maintainer: Amy <amy at fluff dot tech>

_distnum=3004
_distname="dist-chrome-${_distnum}.zip"

pkgname=bitwarden-chromium
pkgver=1.49.1
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
sha512sums=('76e4d44151b17a5954ddb3d5ae75ec2571666de6cdf4eb2f021b2d0e7b09f00bcbd640ae8508210263b611ea771262b9a91b75406180adc7cd07d1be5828dc9e')

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
