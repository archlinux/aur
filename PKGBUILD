# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
pkgname=jd-gui-duo
pkgver=2.0.111
pkgrel=1
pkgdesc="A 2-in-1 JAVA decompiler based on JD-CORE v0 and v1"
arch=('any')
url="https://github.com/nbauma109/$pkgname"
license=('GPL-3.0')
depends=('java-runtime>=25')
makedepends=('maven' 'jdk25-openjdk')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/nbauma109/$pkgname/archive/refs/tags/$pkgver.tar.gz"
	"jd-gui-duo"
	"jd-gui-duo.desktop"
	"jd_icon_128.png"
	"assembler_pom.patch"
)
sha256sums=('bfbead56eea346f92ea20e936cd34440487fa1fb34e76499fe56bace6edde0d3'
            '7e3c81892a95aa411afe7a5dc93b5e7a891b1c52fcc65670a08b5b5618b8aafc'
            'd40a09c9c228b55dcb54823b878cd180521386a11abffed478ce89439fd4e184'
            '62c763642af8cbfd1e00dc8763dcc92a66eefc7aceaa4069d29909bfc197240a'
            '2f409c4c2a84c3581375e8f6bf2404ce4e6279d3009bd77d64427ef830b8aa49')

build() {
	patch "$pkgname-$pkgver/assembler/pom.xml" < "assembler_pom.patch"
	cd "$pkgname-$pkgver"
	JAVA_HOME="/usr/lib/jvm/java-25-openjdk" mvn package --no-transfer-progress
}

package() {
	install -d "$pkgdir/usr/share/java/$pkgname"
	cp -r "$srcdir/$pkgname-$pkgver/assembler/target/lib" "$pkgdir/usr/share/java/$pkgname"
	install -Dm755 "jd-gui-duo" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "jd-gui-duo.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "jd_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
