# Maintainer: Stefan Zobel <stefan dot zobel at gmail dot com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Guillaume ALAUX <guillaume at archlinux dot org>

pkgname=log4j
pkgver=2.19.0
pkgrel=1
pkgdesc='Logging library for Java'
arch=('any')
url='https://logging.apache.org/log4j/2.x/'
license=('APACHE')
# As of 2.13.0 Log4j-2 requires Java 8 or greater at runtime
depends=('java-runtime>=8')
source=(https://downloads.apache.org/logging/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz)
sha256sums=('cb9bb503ce0b2681c364ac4aaa44f3192ec465944da24f2fe1e5e33883297b8e')

package() {
  cd "${srcdir}/apache-${pkgname}-${pkgver}-bin"

  jars=$(find . \
    -name "*.jar" -a ! -name "*-sources.jar" -a ! -name "*-javadoc.jar" -a ! -name "*-tests.jar")

  for j in ${jars[@]}; do
    install -D ${j} "${pkgdir}"/usr/share/java/${pkgname}/${j}
    ln -s ${pkgname}/${j} ${pkgdir}/usr/share/java/${j/-$pkgver}
  done
}
