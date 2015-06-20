# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=crawljax
pkgver=3.6
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
sha256sums=('a16a7b11a7f65f11e525104d9f60be8855f1a327b9b25649b24f0f47c9d0cfbe'
            'c9d7111e3080ee9a32ff8de4ca5c5ae89d8131e70f945f3afafebd583b3fbca4')

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
