# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Daniel Plank <tyrolyean@semi-professional.net>

pkgname=freerouting
pkgver=1.8.0
pkgrel=1
pkgdesc="Advanced PCB autorouter"
arch=('i686' 'x86_64')
url="https://github.com/freerouting/freerouting"
license=('GPL3')
depends=('jre17-openjdk>=17')
makedepends=('jdk17-openjdk>=17' git)
optdepends=('kicad: for use with PCB editor')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "freerouting.sh"
        "freerouting.desktop")
sha512sums=('18110b33815d115966e5688a6b6869e07b75611773285ca1173b241cd7766b03a628365f5dc96fc24a7734f901b94faae176519e161b1b6efdd8852b9f274e14'
            '0a43367f8a9168a94176041f665dbc278b40fcc7a6e6d5c978fcd49081245e030e7b9524056e6fa5acf593d744dd58c25d6d8303b7b2ea6128f6016d05aa28ef'
            '1eeacc544cd6081a9cef03424e505177972c65dc13d1379989889c0ed7419ed1b76013d48d160d0b74932aec1170ca1535b103f4266024b7f35e9656a11281f5')

build() {
  echo "$(tput setaf 196)$(tput bold)Don't forget to set active JDK to 17 version before running makepkg:"
  echo "  sudo archlinux-java set java-17-openjdk$(tput sgr0)"

  cd "${pkgname}-${pkgver}"

  ./gradlew assemble
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable.jar"

  install -Dm755 "${srcdir}/freerouting.sh" "${pkgdir}/usr/bin/freerouting"

  install -Dm644 design/icon/freerouting_icon_256x256_v2.png "${pkgdir}/usr/share/icons/freerouting.png"
  install -Dm644 "${srcdir}/freerouting.desktop" "${pkgdir}/usr/share/applications/freerouting.desktop"
}
