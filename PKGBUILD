# Maintainer: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=2.2.29
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment')
makedepends=('sbt')
source=(https://github.com/ucb-bar/chisel/archive/v$pkgver.tar.gz)
sha512sums=('e6f951e5e297136a4ba6a1d5c6ec9955c03dfd961d4333e930f3a9d783563da759a6160bbaff78bcbfeff1629bcfb8d89a73903947692f20e55938bf0e643304')

build(){
    cd $srcdir/chisel-$pkgver
    sbt publish-local
}

package() {
    install -d \
            "$pkgdir"/usr/share/licenses/"$pkgname" \
            "$pkgdir"/usr/share/scala/chisel/

    cd "$srcdir"/chisel-$pkgver

    install -Dm644 \
            target/scala-2.11/chisel_2.11-$pkgver.jar \
            "$pkgdir"/usr/share/scala/chisel/chisel.jar

    install -Dm644 \
            src/LICENSE.TXT \
            "$pkgdir"/usr/share/licenses/"$pkgname"/
}
