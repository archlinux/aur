# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=glacier-hash
pkgver=1
pkgrel=0
pkgdesc='Computes the SHA256 tree hash of a file'
arch=('any')
license=('custom')
url='https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html'
makedepends=('java-environment')
depends=('java-runtime')

_class=TreeHash

source=(
  "glacier-hash"
  "${_class}.java"
)

md5sums=(
  'dff070b256b9d7d936e657ab5263d131'
  '1308e53e009bbcf507556505e13beac4'
)

build() {
  cd "${srcdir}"

  ${JAVA_HOME}/bin/javac ${_class}.java
  ${JAVA_HOME}/bin/jar cvfe ${_class}.jar ${_class} ${_class}.class
}

package() {
  cd "${srcdir}"

  install -d ${pkgdir}/usr/share/java/${pkgname}/
  install -d ${pkgdir}/usr/bin/
  install -m644 ${_class}.jar ${pkgdir}/usr/share/java/${pkgname}/
  install -m755 glacier-hash ${pkgdir}/usr/bin/
}
