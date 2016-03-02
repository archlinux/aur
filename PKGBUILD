pkgname=kobalt
pkgver=0.643
pkgrel=1
pkgdesc="A modern and versatile build system (for the JVM)."
arch=('i686' 'x86_64')
url="http://beust.com/kobalt/"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('unzip')
source=("https://github.com/cbeust/kobalt/releases/download/0.643/${pkgname}-${pkgver}.zip")
sha512sums=("3f4564b08ecc17bba5abe5ff1d649430ab2774538eb947dd6e256770fd574d6c0391931ef279a4d8985f0ba9b3b3be77d16667eb6a384ff797b17e729f424216")
noextract=("${pkgname}-${pkgver}.zip")

prepare() {
  unzip ${pkgname}-${pkgver}.zip
  sed -i -e "s@\$(dirname \$0)/${pkgname}/wrapper/@/usr/share/java/${pkgname}/@" kobaltw
  sed -i -e "s@${pkgname}-wrapper.jar@${pkgname}-${pkgver}.jar@" kobaltw
}
package() {
  install -Dm 755 kobaltw ${pkgdir}/usr/bin/kobalt
  install -Dm 644 kobalt/wrapper/${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
}
