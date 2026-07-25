# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
pkgname=jd-gui-duo
pkgver=2.0.114
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
sha256sums=('6c0424cb1928cb9a011fc1aa613d79f43c9252bd3e9fbd681a87eee7f42398df'
            '7e3c81892a95aa411afe7a5dc93b5e7a891b1c52fcc65670a08b5b5618b8aafc'
            'd40a09c9c228b55dcb54823b878cd180521386a11abffed478ce89439fd4e184'
            '62c763642af8cbfd1e00dc8763dcc92a66eefc7aceaa4069d29909bfc197240a'
            'a012a4750b13854f6c07a4fd83402a4907f0e03d3fc549f9cd90f10218b255f3')

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
