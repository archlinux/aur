# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Maintainer: Misaka13514 <misaka13514 at gmail dot com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Daniel Plank <tyrolyean@semi-professional.net>

pkgname=freerouting
pkgver=1.9.0
_jrever=17
_jdkver=17
pkgrel=2
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://github.com/freerouting/freerouting"
license=('GPL-3.0-only')
depends=("java-runtime=${_jrever}")
makedepends=("java-environment-openjdk=${_jdkver}")
optdepends=('kicad: for use with PCB editor')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "freerouting.sh"
        "freerouting.desktop")
sha512sums=('ed51eeaaa1315b3fb4311f4f0a74e64266492b2a8e6aff69179911e31b8c612825c7783228a0dddc8f06fc92962f426ccb7f6305d8ff7537a0009f82841a8ab0'
            '3ff1a906c3f02e0e0077599cfad8082fa11c8b321e90b3e466b70969b44c4675ac6df6b898fda4d2b17d9f263787d319dab6c836a37b1ff4737f715730819ce3'
            '1eeacc544cd6081a9cef03424e505177972c65dc13d1379989889c0ed7419ed1b76013d48d160d0b74932aec1170ca1535b103f4266024b7f35e9656a11281f5')

build() {
  cd "${pkgname}-${pkgver}"

  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  ./gradlew assemble
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 build/libs/freerouting-executable.jar "${pkgdir}/usr/lib/freerouting/freerouting-executable.jar"

  install -Dm755 "${srcdir}/freerouting.sh" "${pkgdir}/usr/bin/freerouting"

  install -Dm644 design/icon/freerouting_icon_256x256_v2.png "${pkgdir}/usr/share/icons/freerouting.png"
  install -Dm644 "${srcdir}/freerouting.desktop" "${pkgdir}/usr/share/applications/freerouting.desktop"
}
