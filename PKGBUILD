# Maintainer: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=2.2.27
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment')
makedepends=('sbt')
source=(https://github.com/ucb-bar/chisel/archive/v$pkgver.tar.gz)
md5sums=('8898537587c20b23e7add342aa51f2ff')
sha256sums=('a4c344f9666058db4bd3f7093d02762c46314ab15b8091f6a47b4331ccb8baec')

build(){
    cd $srcdir/chisel-$pkgver
    sbt +publish-local
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
