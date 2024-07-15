# Contributor: grimsock <lord.grimsock at gmail dot com>

pkgname=crawljax
pkgver=5.0
pkgrel=1
pkgdesc="Open source Java tool for automatically crawling and testing modern web applications"
arch=('any')
url="http://crawljax.com/"
license=('apache')
depends=('java-runtime>=11')
makedepends=('unzip')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-cli-${pkgver}.zip"
        "crawljax")
noextract=("${pkgname}-cli-${pkgver}.zip")
sha256sums=('ad8325d2f55d50da7e276e4c821bd0474a96eb79d6fdd603bc49c64f11015495'
            'a1841bc86269ffa6ec46bf061c16249cf55b899a9fd53078a20171e55a39bd2a')

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
