# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Daniel Plank <tyrolyean@semi-professional.net>

pkgname=freerouting
pkgver=1.6.5
pkgrel=1
pkgdesc="Advanced PCB autorouter"
arch=('i686' 'x86_64')
url="https://github.com/freerouting/freerouting"
license=('GPL3')
depends=('jre17-openjdk>=17')
makedepends=('jdk17-openjdk>=17' git)
optdepends=('kicad: for use with PCB editor')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "freerouting.sh")
sha256sums=('b05a54e907ef1cb82b749c262727e2ab2a1ad8d20f5e6b91d0af4bcf4e903fe7'
            '8144ced213d127ef0d16abc787055bc3dd646db66ddee762ae9ba02f55bb3f73')

build() {
  # Don't forget to set active JDK to 17 version before running makepkg:
  # sudo archlinux-java set java-17-openjdk
  cd "${pkgname}-${pkgver}"

  ./gradlew assemble
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable.jar"
  install -Dm755 "${srcdir}/freerouting.sh" "${pkgdir}/usr/bin/freerouting"
}
