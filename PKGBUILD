# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
pkgname=jd-gui-duo
pkgver=2.0.88
pkgrel=1
pkgdesc="A 2-in-1 JAVA decompiler based on JD-CORE v0 and v1"
arch=('any')
url="https://github.com/nbauma109/jd-gui-duo"
license=('GPL3')
depends=('java-runtime>=17')
makedepends=('maven' 'jdk17-openjdk')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/nbauma109/jd-gui-duo/archive/refs/tags/$pkgver.tar.gz"
	"jd-gui-duo"
	"jd-gui-duo.desktop"
)
sha256sums=('a695db5b8233e9fccaec1751cf0deab523327c110dada94857eb16aeaa62ce56'
            '361a309046efc77962a5ca82c7ea3a3fdbf9c38882946c98b8664fec7e3ad054'
            'd40a09c9c228b55dcb54823b878cd180521386a11abffed478ce89439fd4e184')


build() {
	cd "$pkgname-$pkgver"
	JAVA_HOME="/usr/lib/jvm/java-17-openjdk" mvn clean package --no-transfer-progress
}

package() {
	install -d "$pkgdir/usr/share/java/$pkgname"
	cp -r "$srcdir/$pkgname-$pkgver/assembler/target/lib" "$pkgdir/usr/share/java/$pkgname"
	install -Dm755 "jd-gui-duo" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "jd-gui-duo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/linux/resources/jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
