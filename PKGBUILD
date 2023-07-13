# Maintainer: EdJoPaTo <snoopy-aur@edjopato.de>
pkgname=snoopy
pkgver=2022.08.27
pkgrel=1
pkgdesc="software tool to design and animate hierarchical graphs, among others Petri nets"
arch=("x86_64")
url="https://www-dssz.informatik.tu-cottbus.de/DSSZ/Software/Snoopy"
license=('custom: non-professional use only')
depends=('gtk2'
	'libpng'
	'libsm')
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=("${pkgname}")
source=("$pkgname-stable-linux-64-${pkgver//./-}.tgz::https://www-dssz.informatik.tu-cottbus.de/track/download.php?id=259"
	"runscript.sh"
	"snoopy.desktop"
	"snoopy.png")
sha256sums=('b0033b7b825f76bd95c24915c9fb333b1fbdb40d07bcc0762c0b8ccc5d69d3da'
            '6400dcdf01072e40fc855481d42ea33c3eb11aa53d0b8a3dc10ebfbda96b0fb4'
            'e9ebf3ce027808d74f14ab02b4ac34b3e3e21fe0c2c83fb9a3298787be5c6d3c'
            '5ad73e78cc910a26f09c690f730289fb5a707bc9cabc1f035dea19ca3a24ca1d')

package() {
	install -Dm755 "${srcdir}/runscript.sh" "${pkgdir}/usr/bin/snoopy"

	install -d "${pkgdir}/usr/lib/${pkgname}/"
	cp -r "${srcdir}/snoopy2/lib"/* "${pkgdir}/usr/lib/${pkgname}"
	install -Dm755 "${srcdir}/snoopy2/bin/snoopy" -t "${pkgdir}/usr/lib/${pkgname}/"

	install -d "${pkgdir}/usr/share/doc/${pkgname}/"
	unzip -q "${srcdir}/snoopy2/share/help.zip" -d "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/icons/"
}
