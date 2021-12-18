# Maintainer: Stefan Zobel <stefan dot zobel at gmail dot com>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Guillaume ALAUX <guillaume at archlinux dot org>

pkgname=log4j
pkgver=2.17.0
pkgrel=1
pkgdesc='Logging library for Java'
arch=('any')
url='https://logging.apache.org/log4j/2.x/'
license=('APACHE')
# As of 2.13.0 Log4j-2 requires Java 8 or greater at runtime
depends=('java-runtime>=8')
source=(https://downloads.apache.org/logging/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz)
sha256sums=('48f9c24d71d884c959012f3bcd3d0e9a9f51dbab6992765387b94b2edfb83333')

package() {
  cd "${srcdir}/apache-${pkgname}-${pkgver}-bin"

  jars=$(find . \
    -name "*.jar" -a ! -name "*-sources.jar" -a ! -name "*-javadoc.jar" -a ! -name "*-tests.jar")

  for j in ${jars[@]}; do
    install -D ${j} "${pkgdir}"/usr/share/java/${pkgname}/${j}
    ln -s ${pkgname}/${j} ${pkgdir}/usr/share/java/${j/-$pkgver}
  done
}
