# Maintainer: Guillaume ALAUX <guillaume at archlinux dot org>
pkgname=log4j
pkgver=2.3
pkgrel=1
pkgdesc='Logging library for Java'
arch=('any')
url='http://logging.apache.org/log4j/'
license=('APACHE')
depends=('java-runtime')
source=(https://archive.apache.org/dist/logging/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz)
sha256sums=('a0118cccd0fa930705319b2ea031732f2eb6ce8802e3f696a294e3d3eec8c4aa')

package() {
  cd "${srcdir}/apache-${pkgname}-${pkgver}-bin"

  jars=$(find . \
    -name "*.jar" -a ! -name "*-sources.jar" -a ! -name "*-javadoc.jar" -a ! -name "*-tests.jar")

  for j in ${jars[@]}; do
    install -D ${j} "${pkgdir}"/usr/share/java/${pkgname}/${j}
    ln -s ${pkgname}/${j} ${pkgdir}/usr/share/java/${j/-$pkgver}
  done
}
