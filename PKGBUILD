pkgname=kobalt
pkgver=0.865
pkgrel=1
pkgdesc="A modern and versatile build system (for the JVM)."
arch=('i686' 'x86_64')
url="http://beust.com/kobalt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=("https://github.com/cbeust/kobalt/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=("bf04586918cb36bf293995a085fc059d3f1df7bbd240d0199d6b7e4f9d24cc577051a08eed547e03c1a9191a6847ec0dad121b77c93ba00b7b38d3e9604e119b")
noextract=("${pkgname}-${pkgver}.zip")

prepare() {
  unzip ${pkgname}-${pkgver}.zip
  echo '#!/usr/bin/env sh' > kobalt-${pkgver}/bin/kobaltw
  echo "java -jar /usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar \$*" >> kobalt-${pkgver}/bin/kobaltw
  
}
package() {
  install -Dm 755 kobalt-${pkgver}/bin/kobaltw ${pkgdir}/usr/bin/kobalt
  install -Dm 644 kobalt-${pkgver}/kobalt/wrapper/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
}
