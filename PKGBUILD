# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=glacier-hash
pkgver=1
pkgrel=1
pkgdesc='Computes the SHA256 tree hash of a file'
arch=('any')
license=('custom')
url='https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html'
makedepends=('java-environment')
depends=('java-runtime')

_class=TreeHash

source=("glacier-hash"
        "${_class}.java")

sha256sums=('9d8417046b9852e26b06dd8deaa5be09aee4e5f20489377de5d1814ec513758d'
            '22e854749897eafc972e31e486ddfe4f76032d51fec4355af946c64f97f57c49')

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
