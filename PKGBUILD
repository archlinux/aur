# Maintainer: maturain <maturain@gmail.com>
pkgname=msgviewer-lolo101
pkgver=1.8.8
pkgrel=1
pkgdesc="A program to view msg file from outlook (forked version by lolo101)"
arch=(any)
url="https://github.com/lolo101/MsgViewer/"
license=('GPLv3')
depends=(java-runtime>=11)
makedepends=(jdk11-openjdk)
conflicts=("msgviewer")
source=("https://github.com/lolo101/MsgViewer/archive/refs/tags/msgviewer-${pkgver}.tar.gz"
	"msgviewer")
sha256sums=('c22fac285f31fff7270993b1f605012a16497209b2a7f5154c7d864f01003637'
            '3196fb7a19b3867663bc7cc22eaae3d725af1e7d17005cdb7fa6da2d13036521')
build() {
	cd ${srcdir}/MsgViewer-msgviewer-${pkgver}/
	./mvnw package -DskipTests=true
}
package() {
	path="opt/msgviewer"
    mkdir -p $pkgdir/${path}
    cp $srcdir/msgviewer $pkgdir/${path}/
    cp $srcdir/MsgViewer-msgviewer-${pkgver}/MSGViewer/target/msgviewer.jar $pkgdir/${path}/
    mkdir -p $pkgdir/usr/bin
    ln -s "/${path}/msgviewer" "$pkgdir/usr/bin/msgviewer"
}
