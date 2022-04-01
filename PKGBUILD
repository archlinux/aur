# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Maintainer: Daniel Plank <tyrolyean@semi-professional.net>

pkgname=freerouting
pkgver=1.5.0
pkgrel=1
pkgdesc="Advanced PCB autorouter"
arch=('i686' 'x86_64')
url="https://github.com/freerouting/freerouting"
license=('GPL3')
depends=('jre11-openjdk>=11')
makedepends=('jdk11-openjdk>=11' git)
optdepends=('kicad: for use with PCB editor')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "freerouting.sh")
sha256sums=('36742a91e492956e3adc5d75e542a40f3e03d15d69d15717a9d39c0585faac44'
            '8144ced213d127ef0d16abc787055bc3dd646db66ddee762ae9ba02f55bb3f73')

build() {
  # don't forget to set active JDK to 11 version before running makepkg:
  # sudo archlinux-java set java-11-openjdk
  cd "${pkgname}-${pkgver}"

  ./gradlew assemble
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable.jar"
  install -Dm755 "${srcdir}/freerouting.sh" "${pkgdir}/usr/bin/freerouting"
}
