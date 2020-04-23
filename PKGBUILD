# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>

pkgname=chemdoodle
pkgver=10.3.0
pkgrel=2
pkgdesc="Chemical drawing and publishing software for desktop, web and mobile (Trial)"
arch=('x86_64')
url="http://www.chemdoodle.com"
license=('custom')
depends=('gtk2'
		 'libxtst'
		 'java-environment'
		 'libxslt'
		 'libxxf86vm'
		 'alsa-lib')
depends_x86_64=('gcc-libs-multilib')
depends_i686=('gcc-libs')
makedepends=('gendesk')
source=("https://www.ichemlabs.com/downloads/ChemDoodle-linux-${pkgver}.bin")
sha256sums=('5680f50918c547ef97f378e2c6f6a30bda7cf78e50df003c05fda3c1f076e16b')
_appname=ChemDoodle

prepare() {
  cd "$srcdir"
  # Create desktop file
  gendesk -f -n --pkgname "$pkgname" \
	--pkgdesc "$pkgdesc" \
	--name "ChemDoodle" \
	--genericname "ChemDoodle" \
	--comment "$pkgdesc" \
	--exec /opt/ChemDoodle/ChemDoodle \
	--categories 'Education;Science;Graphics;Office;Application;'
}

package() {
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