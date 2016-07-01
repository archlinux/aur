pkgname=kobalt
pkgver=0.833
pkgrel=1
pkgdesc="A modern and versatile build system (for the JVM)."
arch=('i686' 'x86_64')
url="http://beust.com/kobalt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=("https://github.com/cbeust/kobalt/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha512sums=("0f719b6ba5c9be974b67774173a7441f029de58b5430daee6d5421e5b5259cfe0d0d794f773adce1335bbe3359ad4706d5d228d002e410d25cb2264a21b3ee13")
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
