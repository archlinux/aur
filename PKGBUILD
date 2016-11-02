pkgname=kobalt
pkgver=0.905
pkgrel=1
pkgdesc="A modern and versatile build system (for the JVM)."
arch=('i686' 'x86_64')
url="http://beust.com/kobalt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=("https://github.com/cbeust/kobalt/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=("d363155004d7d02a254a178467d78ac0392a708ad80620411fed2f5797ff5561715c9978501fe48018605927e4710334e30104df1ac96128b55f3ed7cab76bca")
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
