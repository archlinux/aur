# Maintainer: Mohit <>
pkgname=code-maat
pkgver=1.0.4
pkgrel=1
pkgdesc="A command line tool to mine and analyze data from version-control systems"
arch=('any')
url="https://github.com/adamtornhill/code-maat"
license=('GPL3')
depends=('java-runtime-headless>=8')
source=(
	"$pkgname-$pkgver-standalone.jar::https://github.com/adamtornhill/code-maat/releases/download/v$pkgver/code-maat-$pkgver-standalone.jar"
)
noextract=("$pkgname-$pkgver-standalone.jar")
sha256sums=('4287ae2034901844450f769547bc4497a0da1a6d1c7fa6fadc858705e6743b5f')

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver-standalone.jar" \
		"$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/code-maat" <<-'EOF'
	#!/bin/sh
	exec java -jar /usr/share/java/code-maat/code-maat.jar "$@"
	EOF

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf /usr/share/licenses/common/GPL3/license.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
