# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=beansbinding
pkgver=1.2.1
pkgrel=2
pkgdesc="Beans Binding API (implementation of JSR295)"
arch=('any')
url="https://tracker.debian.org/pkg/beansbinding"
license=('LGPL-2.1-only')
depends=('java-runtime')
makedepends=('jdk8-openjdk' 'ant')
source=("http://deb.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('46f618e7c8c4940456cfe1f95cbf489ff872a2424457ec973812b908b17bb694')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  export PATH="${JAVA_HOME}/bin:${PATH}"
  ant jar
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 dist/beansbinding.jar "${pkgdir}/usr/share/java/beansbinding-${pkgver}.jar"
  ln -sf "beansbinding-${pkgver}.jar" "${pkgdir}/usr/share/java/beansbinding.jar"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
