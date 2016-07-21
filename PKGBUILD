pkgname=kobalt
pkgver=0.864
pkgrel=1
pkgdesc="A modern and versatile build system (for the JVM)."
arch=('i686' 'x86_64')
url="http://beust.com/kobalt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=("https://github.com/cbeust/kobalt/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=("180ada9cb5c61ca44924fa051652c48a2b9834150be6de61e759ee11bfb3afb4c2ebb9c84d88566f4683d883d6523ffbe5016b3993f897f758a8c2be289b67ca")
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
