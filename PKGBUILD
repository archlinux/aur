# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: David Runge <dave@sleepmap.de>
pkgname=easytranscript
pkgver=2.51.5
pkgrel=1
pkgdesc="Easy to use transcription-software with a variety of features"
arch=(i686 x86_64)
url="https://e-werkzeug.eu/index.php/en/products/${pkgname}"
license=(Apache-2.0 CC-BY-SA-3.0-DE GPL-3.0-or-later LGPL-2.1-or-later)
depends=(java-openjfx java-commons-logging java-commons-io vlc)
makedepends=('java-environment=22' 'unzip')
source=("${pkgname}-${pkgver}.zip::https://e-werkzeug.eu/software/${pkgname}/versions/${pkgver}/${pkgname}.zip"
  "${pkgname}.desktop"
  "${pkgname}")
noextract=("${pkgname}-${pkgver}.zip")
sha512sums=('6ecdb19b97bde91cb6802e7568dfbf150cac29184bf5c0a31acf7ff8227c92a0409c853071906ee960eaa0f807fab4aab8a58943244548d34a52d1eb24d7d28d'
  '210a9ef94a3d068e58392ff5d4aed85f4665d8fd614a6aa809ab7e7357b68b689788bf72da508650808e722f862f7c1b25c3f61babb15582b4ffc9593ae34a21'
  '7057572280077fa89fb7b95b2a012f6328af608ca1166b957d0516a1ac71387979432ae9a035540ba4382a8d4d4247437157beacbe2f34b81a906d0932ecd0a2')

build() {
  mkdir -vp "${pkgname}-${pkgver}"
  unzip "${pkgname}-${pkgver}.zip" -d "${pkgname}-${pkgver}"
}

package() {
  # TODO: replace beansbinding and commons-collection (which doesn't build)
  # local libs=('AbsoluteLayout' 'beansbinding' 'commons-collections'
  #   'commons-net' 'commons-vfs' 'dom4j' 'jdom' 'jintellitype' 'jna' 'JXGrabKey'
  #   'mail' 'platform' 'poi' 'vlcj' 'xmlbeans')
  cd "${pkgname}-${pkgver}"
  install -vDm 644 "README (Troubleshooting Linux).txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm 644 easysysteminspector.jar \
    -t "${pkgdir}/usr/share/java/${pkgname}"
  install -vDm 644 "${pkgname}.jar" \
    -t "${pkgdir}/usr/share/java/${pkgname}"
  install -vDm 644 updater.jar \
    -t "${pkgdir}/usr/share/java/${pkgname}"
  # for library in "${libs[@]}"; do
  #   install -vDm 644 "lib/${library}"*.jar \
  #     -t "$pkgdir/usr/share/java/${pkgname}/lib/"
  # done
  install -vDm 755 libJXGrabKey.so -t "${pkgdir}/usr/share/java/${pkgname}/lib/"
  install -vDm 644 logo.ico "${pkgdir}/usr/share/icons/${pkgname}.ico"
  install -vDm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm 644 "${srcdir}/${pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications"
}
