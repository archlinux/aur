# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan McCurry <dan.mccurry at linux dot com>

pkgname=chemdoodle
_appname=ChemDoodle
pkgver=11.1.0
pkgrel=1
pkgdesc="Chemical drawing and publishing software for desktop, web and mobile (Trial)"
arch=('x86_64')
url='http://www.chemdoodle.com'
license=("custom:${pkgname}")
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
sha256sums=('955bf919c4bfd6bea0e78b3d9d2e5fb16e162f6099e1822e6db9ad21bcd3ccc9')

package() {
  gendesk -f -n --pkgname "$pkgname" \
          --pkgdesc "$pkgdesc" \
          --name "$_appname" \
          --genericname "$_appname" \
          --comment "$pkgdesc" \
          --exec /opt/$_appname/$_appname \
          --categories 'Education;Science;Graphics;Office;Application'
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/$_appname/resources/$_appname.png" \
  "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/$_appname/external/Licenses/Licenses.txt" \
  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/$_appname/docs/UserGuide.pdf" \
   -t "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/opt"
  cp -avR "${srcdir}/$_appname" "${pkgdir}/opt/"
}
