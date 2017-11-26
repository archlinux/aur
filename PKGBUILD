# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
_pkgname=chisel3
pkgver=3.0.0
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt')
source=(https://github.com/freechipsproject/chisel3/archive/v$pkgver.tar.gz)
sha512sums=('4cb51b5d1bc504c9a8dbcc5ff5b971c67d6414f8befb9da2b38611e52b149e77ca10711d560f3f8ee8f9452af7b8e2e85926b07b61876c0cd4401bafce76c3ef')

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
