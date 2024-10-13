# Maintainer: Sematre <sematre at gmx dot de>
pkgname=eac3to
pkgver=3.52
pkgrel=1

pkgdesc="Audio/Video processing software with focus on new generation HD formats, Blu-ray and HD DVD."
arch=('x86_64')
url="https://www.rationalqm.us/board/viewforum.php?f=18"
license=('custom')

depends=('wine' 'ncurses')
makedepends=('unrar' 'wget')

source=("${pkgname}-${pkgver}.rar::https://www.rationalqm.us/eac3to/eac3to_${pkgver}.rar"
        "start-eac3to.sh"
		"start-thdmerge.sh")
sha256sums=('27e7c5990b60a3b9a6969712888c64886bfd578f114675e49f92aaf912b17e34'
            '77854b4d72e15771937e8485ac9944071242c96f21eda0e02cd3e060ee78421f'
            'c8d204d497d3756bfa4459b77ff1a495fb16ba2226020867716f9d3d39de8ebc')
noextract=("${pkgname}-${pkgver}.rar")

# The website seems to block cURL, so we'll be using Wget.
DLAGENTS=('https::/usr/bin/wget -O %o %u')

package() {
	# Unpack application
	mkdir -p "${pkgdir}/usr/share/eac3to"
	cd "${pkgdir}/usr/share/eac3to"
	unrar x "${srcdir}/${pkgname}-${pkgver}.rar"

	# Install startup script
	install -Dm755 "${srcdir}/start-eac3to.sh"   "${pkgdir}/usr/bin/eac3to"
	install -Dm755 "${srcdir}/start-thdmerge.sh" "${pkgdir}/usr/bin/thdmerge"

	# License
	install -Dm644 "${pkgdir}/usr/share/eac3to/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
