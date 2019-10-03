# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=crawljax
pkgver=4.1
pkgrel=1
pkgdesc="Open source Java tool for automatically crawling and testing modern web applications"
arch=('any')
url="http://crawljax.com/"
license=('apache')
depends=('java-runtime')
optdepends=('phantomjs: headless Webkit')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-cli-${pkgver}.zip"
        "crawljax")
noextract=("${pkgname}-cli-${pkgver}.zip")
sha256sums=('6747860622525d3aab00f1f4f4f1352fb3c77bfd7f9a2cd54ffcaf0cb36f72cc'
            '0e18a375917aed0e7ddeab976826b970badc67f8f3df899e1399162a76e273d6')

package() {
  unzip "${pkgname}-cli-${pkgver}.zip" -d "${srcdir}"

  install -Dm 644 "${srcdir}/${pkgname}-cli-${pkgver}/${pkgname}-cli-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-cli-${pkgver}.jar"

  # lib jars
  jars=`ls "${srcdir}/${pkgname}-cli-${pkgver}/lib/"`
  for jar in $jars; do
    install -Dm 644 "${srcdir}/${pkgname}-cli-${pkgver}/lib/${jar}" "${pkgdir}/usr/share/java/${pkgname}/lib/${jar}"
  done

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
