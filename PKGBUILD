# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
pkgname=jd-gui-duo
pkgver=2.0.89
pkgrel=2
pkgdesc="A 2-in-1 JAVA decompiler based on JD-CORE v0 and v1"
arch=('any')
url="https://github.com/nbauma109/jd-gui-duo"
license=('GPL3')
depends=('java-runtime>=21')
makedepends=('maven' 'jdk21-openjdk')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/nbauma109/jd-gui-duo/archive/refs/tags/$pkgver.tar.gz"
	"jd-gui-duo"
	"jd-gui-duo.desktop"
)
sha256sums=('5fefc06d3b6a48366b0bf35d875e4d3ca854b8def0307fb9b4635051211f6586'
            '9d175e28662dd1ad701f76d5aa7f7752543453f156615b96787e641252ce60e4'
            'd40a09c9c228b55dcb54823b878cd180521386a11abffed478ce89439fd4e184')


build() {
	cd "$pkgname-$pkgver"
	JAVA_HOME="/usr/lib/jvm/java-21-openjdk" mvn clean package --no-transfer-progress
}

package() {
	install -d "$pkgdir/usr/share/java/$pkgname"
	cp -r "$srcdir/$pkgname-$pkgver/assembler/target/lib" "$pkgdir/usr/share/java/$pkgname"
	install -Dm755 "jd-gui-duo" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "jd-gui-duo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/linux/resources/jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
