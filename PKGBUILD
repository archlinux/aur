# Maintainer: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=chisel-git
pkgver=r2895.edfc2c4
pkgrel=1
pkgdesc='Constructing Hardware in a Scala Embedded Language'
arch=('any')
url='https://chisel.eecs.berkeley.edu/'
license=('BSD')
provides=('chisel')
conflicts=('chisel')
depends=('java-environment')
makedepends=('sbt' 'git')
source=('git+https://github.com/ucb-bar/chisel.git')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd $srcdir/chisel
    sbt publish-local
}

package() {
    install -d \
            "$pkgdir"/usr/share/licenses/"$pkgname" \
            "$pkgdir"/usr/share/scala/chisel/

    cd "$srcdir"/chisel

    install -Dm644 \
            target/scala-2.11/chisel_2.11-2.3-SNAPSHOT.jar \
            "$pkgdir"/usr/share/scala/chisel/chisel.jar

    install -Dm644 \
            src/LICENSE.TXT \
            "$pkgdir"/usr/share/licenses/"$pkgname"/
}

