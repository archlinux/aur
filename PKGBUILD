pkgname=kobalt
pkgver=1.0.32
pkgrel=1
pkgdesc="A modern and versatile build system (for the JVM)."
arch=('i686' 'x86_64')
url="http://beust.com/kobalt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=("https://github.com/cbeust/kobalt/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=("b0b75427afdd5772fd84977f9a629b6f0a157f0c3551485bbd54b4aad41bb13be3d847f9d2918a28fe15c978bb444e4e45c32ec68a74304d20475988b06e3d40")
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
