# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Guillaume ALAUX <guillaume at archlinux dot org>

pkgname=log4j
pkgver=2.7
pkgrel=1
pkgdesc='Logging library for Java'
arch=('any')
url='http://logging.apache.org/log4j/'
license=('APACHE')
depends=('java-runtime')
source=(https://archive.apache.org/dist/logging/${pkgname}/${pkgver}/apache-${pkgname}-${pkgver}-bin.tar.gz)
sha256sums=('6b4976a6a80767bd86ca3a8c5a2a2f3a359e8d7e0698985e7c93a287d6d8378c')

package() {
  cd "${srcdir}/apache-${pkgname}-${pkgver}-bin"

  jars=$(find . \
    -name "*.jar" -a ! -name "*-sources.jar" -a ! -name "*-javadoc.jar" -a ! -name "*-tests.jar")

  for j in ${jars[@]}; do
    install -D ${j} "${pkgdir}"/usr/share/java/${pkgname}/${j}
    ln -s ${pkgname}/${j} ${pkgdir}/usr/share/java/${j/-$pkgver}
  done
}
