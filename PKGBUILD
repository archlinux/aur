# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
_pkgname=chisel3
pkgver=3.1.0
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt')
source=(https://github.com/freechipsproject/chisel3/archive/v$pkgver.tar.gz)
sha512sums=('fbf67ca7e0b72333eb981265e336b2b2da890a3a995261950a74a61cf55e56658c344a22bdd078a9872a71a8063b164e4ebace8044a9ccfb497f39c113982e9d')

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
