# Maintainer: Massimo Pavoni (damax) <real dot damax at gmail dot com>
# Contributor: Stefan Zobel <stefan dot zobel at gmail dot com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Guillaume ALAUX <guillaume at archlinux dot org>

pkgname=log4j
pkgver=2.26.1
pkgrel=1
pkgdesc='Logging library for Java'
arch=('any')
url='https://logging.apache.org/log4j/2.x/'
license=('Apache-2.0')
# As of 2.13.0 Log4j-2 requires Java 8 or greater at runtime
depends=('java-runtime>=8')
source=(https://archive.apache.org/dist/logging/log4j/${pkgver}/apache-${pkgname}-${pkgver}-bin.zip)
sha256sums=('e1488c19241772da9d391da755536af9da3b10f59ae07747ddd4802ae1a5ea77')

package() {
  cd "${srcdir}"

  jars=$(find . \
    -name "*.jar" -a ! -name "*-sources.jar" -a ! -name "*-javadoc.jar" -a ! -name "*-tests.jar")

  for j in ${jars[@]}; do
    install -D ${j} "${pkgdir}"/usr/share/java/${pkgname}/${j}
    ln -s ${pkgname}/${j} ${pkgdir}/usr/share/java/${j/-$pkgver/}
  done
}
