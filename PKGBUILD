# Maintainer: Sematre <sematre at gmx dot de>
pkgname=eac3to
pkgver=3.54
pkgrel=1

pkgdesc="Audio/Video processing software with focus on new generation HD formats, Blu-ray and HD DVD."
arch=('x86_64')
url="https://www.rationalqm.us/board/viewforum.php?f=18"
license=('custom')

depends=('wine' 'ncurses')
makedepends=('unrar')

source=("${pkgname}-${pkgver}.rar::https://archive.org/download/eac3to-${pkgver}/eac3to_${pkgver}.rar"
        "start-eac3to.sh"
		"start-thdmerge.sh")
sha256sums=('3064f5000072f4aa23ca2b96296624f7fd74312ed9f708dd1b08762d92144dc2'
            '357bcdced567df6bc9bffb20d35c9b56c5887d225753ae44011e9e6a64c63dbd'
            '03ed5728ad234efc3fe2ef4da572b670787b858e1be33bd7ab9e4395a1b357ca')
noextract=("${pkgname}-${pkgver}.rar")

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
