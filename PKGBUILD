# Maintainer: Amy <amy at fluff dot tech>

_distnum=2716
_distname="dist-chrome-${_distnum}.zip"

pkgname=bitwarden-chromium
pkgver=1.46.2
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
sha512sums=('d4e9d4c826c45b413695523322078e6c061c250f94db06c2490ffbc06668d4e0227301b2863ac09ff92385f5613640b0ad26cda54a4b3aeac850200c64c0ee93')

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
