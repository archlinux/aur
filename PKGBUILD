# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=freerouting
pkgver=r216.07b7576
pkgrel=2
pkgdesc="Advanced PCB autorouter"
arch=('i686' 'x86_64')
url="https://github.com/freerouting/freerouting"
license=('GPL3')
depends=('jre11-openjdk>=11')
makedepends=('jdk11-openjdk>=11' git)
optdepends=('kicad: for use with PCB editor')
source=("${pkgname}::git+https://github.com/freerouting/freerouting.git"
        "freerouting.sh")
md5sums=('SKIP'
         '6586e9f705ecb5b39cad5440a6389f60')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  ./gradlew assemble
}

package() {
  cd "${pkgname}"
  
  install -Dm644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable.jar"
  install -Dm755 "${srcdir}/freerouting.sh" "${pkgdir}/usr/bin/freerouting"
}
