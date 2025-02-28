# Maintainer: Enbeon <actuallyenbeon at gmail dot com>
pkgname=jd-gui-duo
pkgver=2.0.87
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
sha256sums=('e6e38e23c0b59d45188c4336ca07b2ed392974c58334f14a8ee7e3bc40457286'
            'fdd42c566e0ba0f62b4432191721aaac05175f3bd85de9732e63b3ca52750cf0'
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
