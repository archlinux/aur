# Maintainer: Amy <amy at fluff dot tech>

#_distnum=3017 # deprecated?
pkgver=1.54.0
_distname="dist-chrome-${pkgver}.zip"

pkgname=bitwarden-chromium
#pkgver=1.54.0
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
sha512sums=('2c80149e91863e732b7088c47651f1882c4b914716f4001ca098439206c94cb98e9520b3652a11094b57a696714829288bc71c30158589a19fb1d04ae4b01e2e')

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
