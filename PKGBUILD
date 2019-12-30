# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: archlinux.info:tdy
pkgname='weatherspect'
pkgver='2.0'
pkgrel='1'
pkgdesc='A virtual weather environment in ASCII'
arch=('any')
url="https://github.com/AnotherFoxGuy/$pkgname"
license=('GPL2')
depends=('perl' 'perl-term-animation')
source=("$pkgname-$pkgver-$pkgrel::$url/raw/$pkgver/$pkgname"
		"$pkgname-$pkgver-$pkgrel.diff::$url/commit/b7ac28234c1e93e537787d163ac80361296aaf58.diff"
		"$pkgname.1")
sha256sums=('e4ddd43d566a98b1d2ec136bf613f22f689ef2938479e23ca0082b84ebd6247c'
            'b8685b9d4e9552d538b68aa31400d0970d4e4ffa0eeda981d9fde32210a2ba5a'
            '8b0d7bb995e44190cc005ec3b604f147dcb233744a262cbbf9a9ad8f9214ab0c')

prepare() {
	cd "$srcdir/"
	# https://github.com/AnotherFoxGuy/weatherspect/commit/b7ac28234c1e93e537787d163ac80361296aaf58
	patch --follow-symlinks --forward -p1 "$pkgname-$pkgver-$pkgrel" < "$pkgname-$pkgver-$pkgrel.diff"
}

package() {
	cd "$srcdir/"
	install -Dm755 "$pkgname-$pkgver-$pkgrel" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
