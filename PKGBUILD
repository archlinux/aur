# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=freerouting
pkgver=1.4.4
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
md5sums=('356ffed40fd1b6ba88b4fd3d7289b84c'
         '0943b58a132119e866098f083766a123')

#pkgver() {
#  cd "${pkgname}"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

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
