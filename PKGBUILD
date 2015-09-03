# Maintainer: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel
pkgver=2.2.28
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
depends=('java-environment')
makedepends=('sbt')
source=(https://github.com/ucb-bar/chisel/archive/v$pkgver.tar.gz)
md5sums=('4193e0ca258974fa04605e63ae86b905')
sha256sums=('18bc71bfc4af948af6bea7264cd4efd2f32b6ed7906fe2ed021ee1ad831b891b')

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
