# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>

pkgname=chemdoodle
pkgver=10.4.0
pkgrel=1
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
sha256sums=('0fe00624558dbcbcecddebc223f9ddd9359236d2536e24018c80306e3f09cc2d')
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