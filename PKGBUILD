# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
_pkgname=chisel3
pkgver=3.0.2
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment' 'verilator')
makedepends=('sbt')
source=(https://github.com/freechipsproject/chisel3/archive/v$pkgver.tar.gz)
sha512sums=('125aea105c182e85ff4be3ea828f31d144f68d3ab2fcebefdbc2a048017091879b2c5a75aa171381a6a1d54cce39e61aeb81d935ad062d067b14dfe0856d6eec')

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
