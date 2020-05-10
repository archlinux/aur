# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>

pkgname=chemdoodle
pkgver=10.3.0
pkgrel=3
pkgdesc="Chemical drawing and publishing software for desktop, web and mobile (Trial)"
arch=('x86_64')
url="http://www.chemdoodle.com"
license=('custom')
depends=('gtk2'
		 'libxtst'
		 'java-environment'
		 'libxslt'
		 'libnet'
		 'libxxf86vm'
		 'alsa-lib')
depends_x86_64=('gcc-libs-multilib')
depends_i686=('gcc-libs')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.bin::https://www.ichemlabs.com/downloads/ChemDoodle-linux-${pkgver}.bin")
sha256sums=('5680f50918c547ef97f378e2c6f6a30bda7cf78e50df003c05fda3c1f076e16b')
_appname=ChemDoodle

package() {
  # Create desktop file
  gendesk -f -n --pkgname "$pkgname" \
	--pkgdesc "$pkgdesc" \
	--name "$_appname" \
	--genericname "$_appname" \
	--comment "$pkgdesc" \
	--exec /opt/$_appname/$_appname \
	--categories 'Education;Science;Graphics;Office;Application;'
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
	"${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/$_appname/resources/$_appname.png" \
	"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/$_appname/external/Licenses/Licenses.txt" \
 	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/$_appname/docs/UserGuide.pdf" \
 	 -t "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/$_appname" "${pkgdir}/opt/"
}