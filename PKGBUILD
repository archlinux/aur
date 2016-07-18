pkgname=kobalt
pkgver=0.853
pkgrel=1
pkgdesc="A modern and versatile build system (for the JVM)."
arch=('i686' 'x86_64')
url="http://beust.com/kobalt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=("https://github.com/cbeust/kobalt/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=("b8ece78957dbede2ac7439aca5ff8f6113fb13c1ed57c4b7a1f4535a5e45b850a3d09ac33fb0257ff3ac27796ec13b8dab237e174aaaaa4bb4ae4fbbf800b1ad")
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
