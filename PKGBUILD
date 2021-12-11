# Maintainer: maturain <maturain@gmail.com>
pkgname=msgviewer-lolo101
pkgver=1.8.3
pkgrel=2
pkgdesc="A program to view msg file from outlook (forked version by lolo101)"
arch=(any)
url="https://github.com/lolo101/MsgViewer/tree/msgviewer-1.8.3"
license=('GPLv3')
depends=(java-runtime=11)
makedepends=(jdk11-openjdk)
conflicts=("msgviewer")
source=("https://github.com/lolo101/MsgViewer/archive/refs/tags/msgviewer-${pkgver}.tar.gz"
	"msgviewer")
sha256sums=('ca80500572b6402a303c6c314d7d8cc1989f679f18804473e89a7d855d5dce7b'
    '3196fb7a19b3867663bc7cc22eaae3d725af1e7d17005cdb7fa6da2d13036521')


build() {
	cd ${srcdir}/MsgViewer-msgviewer-${pkgver}/
	./mvnw package
}
package() {
	path="opt/msgviewer"
    mkdir -p $pkgdir/${path}
    cp $srcdir/msgviewer $pkgdir/${path}/
    cp $srcdir/MsgViewer-msgviewer-${pkgver}/MSGViewer/target/msgviewer.jar $pkgdir/${path}/
    mkdir -p $pkgdir/usr/bin
    ln -s "/${path}/msgviewer" "$pkgdir/usr/bin/msgviewer"
}
