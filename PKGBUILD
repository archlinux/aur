# Maintainer: mityada <mityada@gmail.com>
pkgname=jbead
pkgver=1.0.23
pkgrel=2
pkgdesc="A bead rope crochet design software"
arch=('any')
url="http://www.jbead.ch/"
license=('GPL3')
depends=('java-runtime')
makedepends=('unzip')
source=("http://www.jbead.ch/releases/jbead_${pkgver}_linux.tar.gz"
        "jbead"
        "jbead.desktop")
md5sums=('992459d3e9a50ba47df741fec1a75b9c'
         '646212e9c1c27773bf7c188466eb4ced'
         'ccdc5f8ffae08530108fd5aeaa2deb0f')

prepare() {
    cd "$srcdir/${pkgname}_$pkgver"

    unzip -o "$pkgname.jar" "images/jbead-32.png"
}

package() {
    cd "$srcdir"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd "${pkgname}_$pkgver"

    install -Dm644 "$pkgname.jar" "$pkgdir/usr/share/$pkgname/$pkgname.jar"
    install -d "$pkgdir/usr/share/doc/$pkgname/samples"
    install -m644 samples/*.jbb "$pkgdir/usr/share/doc/$pkgname/samples"
    install -Dm644 "images/jbead-32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
