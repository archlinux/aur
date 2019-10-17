# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=3.2.0
pkgrel=2
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt' 'graphviz')
source=(https://github.com/freechipsproject/chisel3/archive/v$pkgver.tar.gz)
sha512sums=('b37557c92bcb5d9f73af3d8bbaf843404537b417532872467144a821cf42efb1b0173b503623fb8892e94beebab1bef0c312177721c31c4765781b44d2466078')

build(){
    cd "${srcdir}/${_pkgname}3-${pkgver}"
    sbt publishLocal
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/scala/${pkgname}/"

    cd "${srcdir}/${_pkgname}3-${pkgver}"
    install -Dm644 target/scala-2.12/${_pkgname}3_2.12-${pkgver}.jar "${pkgdir}/usr/share/scala/${pkgname}/${pkgname}.jar"
    install -Dm644 src/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
