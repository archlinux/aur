pkgname=kobalt
pkgver=0.831
pkgrel=1
pkgdesc="A modern and versatile build system (for the JVM)."
arch=('i686' 'x86_64')
url="http://beust.com/kobalt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=("https://github.com/cbeust/kobalt/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=("0082006129fdc0651f9fe0572042054ec193fc06fc545391303bfd23c4b6e98b9802fb9e382982c302a0ce55bbded3f5e836e5fff9af5b1fedf6625ff33a6f14")
noextract=("${pkgname}-${pkgver}.zip")

prepare() {
  unzip ${pkgname}-${pkgver}.zip
  sed -i -e "s@\$(dirname \$0)/../${pkgname}/wrapper/@/usr/share/java/${pkgname}/@" kobalt-${pkgver}/bin/kobaltw
  sed -i -e "s@${pkgname}-wrapper.jar@${pkgname}-${pkgver}.jar@" kobalt-${pkgver}/bin/kobaltw
}
package() {
  install -Dm 755 kobalt-${pkgver}/bin/kobaltw ${pkgdir}/usr/bin/kobalt
  install -Dm 644 kobalt-${pkgver}/kobalt/wrapper/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
}
