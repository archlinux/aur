# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
_pkgname=chisel3
pkgver=3.0.1
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt')
source=(https://github.com/freechipsproject/chisel3/archive/v$pkgver.tar.gz)
sha512sums=('0a86f619e5cdddedcf17e19dd43bbf9f3db37bb08830e12e6f270f88a32df5bea7d40e270b421bd9d8a54a8f4d851a4b6981c233b497d285fe3061b71c38e6c2')

build(){
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sbt publish-local
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/scala/${pkgname}/"

    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm644 target/scala-2.11/${_pkgname}_2.11-${pkgver}.jar "${pkgdir}/usr/share/scala/${pkgname}/${pkgname}.jar"
    install -Dm644 src/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
