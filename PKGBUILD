# Maintainer: Stefan Zobel <stefan dot zobel at gmail dot com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Guillaume ALAUX <guillaume at archlinux dot org>

pkgname=log4j
pkgver=2.22.1
pkgrel=1
pkgdesc='Logging library for Java'
arch=('any')
url='https://logging.apache.org/log4j/2.x/'
license=('APACHE')
# As of 2.13.0 Log4j-2 requires Java 8 or greater at runtime
depends=('java-runtime>=8')
source=(https://archive.apache.org/dist/logging/log4j//${pkgver}/apache-${pkgname}-${pkgver}-bin.zip)
sha256sums=('449c03924a73a97dd0c807f887fccf0376758e96aa7f0bb095802f8653f0c6cb')

package() {
  cd "${srcdir}"

  jars=$(find . \
    -name "*.jar" -a ! -name "*-sources.jar" -a ! -name "*-javadoc.jar" -a ! -name "*-tests.jar")

  for j in ${jars[@]}; do
    install -D ${j} "${pkgdir}"/usr/share/java/${pkgname}/${j}
    ln -s ${pkgname}/${j} ${pkgdir}/usr/share/java/${j/-$pkgver}
  done
}
