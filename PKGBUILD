# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
_pkgname=chisel3
pkgver=3.1.8
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt')
source=(https://github.com/freechipsproject/chisel3/archive/v$pkgver.tar.gz)
sha512sums=('fd58029d84ef47cc28b5e87224b73378d99cd15f1b01760b965d3ae94f926ea067639420c112992c3e537e83776d9a28d364528cc2b2de90b6a3bc83f3a0b1d5')

build(){
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sbt publishLocal
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/scala/${pkgname}/"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm644 target/scala-2.11/${_pkgname}_2.11-${pkgver}.jar "${pkgdir}/usr/share/scala/${pkgname}/${pkgname}.jar"
    install -Dm644 src/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
