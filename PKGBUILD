# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Guillaume ALAUX <guillaume at archlinux dot org>

pkgname=log4j
pkgver=2.9.0
pkgrel=1
pkgdesc='Logging library for Java'
arch=('any')
url='http://logging.apache.org/log4j/'
license=('APACHE')
depends=('java-runtime')
source=(https://archive.apache.org/dist/logging/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz)
sha256sums=('b625e2406c6a0419a7aaa9375b1117369badf11c4732897d788c4dbacc5cb26b')

package() {
  cd "${srcdir}/apache-${pkgname}-${pkgver}-bin"

  jars=$(find . \
    -name "*.jar" -a ! -name "*-sources.jar" -a ! -name "*-javadoc.jar" -a ! -name "*-tests.jar")

  for j in ${jars[@]}; do
    install -D ${j} "${pkgdir}"/usr/share/java/${pkgname}/${j}
    ln -s ${pkgname}/${j} ${pkgdir}/usr/share/java/${j/-$pkgver}
  done
}
