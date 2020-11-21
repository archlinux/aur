# Maintainer: Pekka Ristola <pekka [dot] a [dot] ristola [at] gmail [dot] com>

pkgname=titokone
pkgver=1.3.0
pkgrel=1
pkgdesc="TTK-91 machine language simulator written in Java"
arch=(any)
url="https://github.com/titokone/titokone"
license=('LGPL')
depends=('java-runtime' 'bash')
makedepends=('java-environment')
source=("https://github.com/titokone/titokone/archive/titokone-${pkgver}.tar.gz"
	"titokone")
sha512sums=('b80ab5c57e65fea68e47f06019a716a2ec0e2a1b631d7ea62a04a94993dfd9f00b170e69c5bb5c85206b6753c2ea8e021f985781629a8a17bc340f2dcbc43551'
            '34ce34ad8f4d93c74a8fd98092eef2078aeb3745c8eb00b3f3c3f682a785367c27cee59cdbafa21ff4c755180873538b7b3bd31b7f5fbc13894095b97dec50a4')

build() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver"
	# Makefile has different version code
	_make_ver="$(grep 'VERSION = ' Makefile | sed 's/VERSION = //')"
	install -Dm 644 "$pkgname-$_make_ver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm 755 "$srcdir/titokone" "$pkgdir/usr/bin/titokone"
}
