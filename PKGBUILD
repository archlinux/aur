# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Edwin Fuquen <edwin.fuquen@gmail.com>

pkgname=java-xml-commons-external
pkgver=1.4.01
pkgrel=1
pkgdesc="Common code and guidelines for xml projects"
arch=(i686 x86_64)
url="http://xml.apache.org/commons/"
license=(apache)
depends=(java-environment)
source=("http://apache.osuosl.org//xerces/xml-commons/source/xml-commons-external-${pkgver}-src.tar.gz")
sha512sums=('9e8f77f7dc65a492548fa2313b49855ad0880fe663acdac865a1b235ea3bc0ba347c4fad3ca16f0c92a60df42a0a802a74525b56ea58dc575cd2d94013561868')

build() {
  # Taken from Ubuntu
  mkdir classes
  javac -source 1.4 -d classes `find org/ javax/ -name '*.java'`

  cd classes/
  jar -cvfm ../xml-apis-ext.jar ../manifest.commons \
    `find -type d -name "sac" -o -name "smil" -o -name "svg"`
  jar -cvfm ../xml-apis.jar ../manifest.commons \
    `find -type f ! \( -wholename "*/sac/*" -o -wholename "*/smil/*" -o -wholename "*/svg/*" \)`
}

package() {
  install -dm755 "${pkgdir}/usr/share/java/xml-commons-external/"
  install -m644 xml-apis.jar "${pkgdir}/usr/share/java/xml-commons-external/"
  install -m644 xml-apis-ext.jar "${pkgdir}/usr/share/java/xml-commons-external/"
}
