# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: archlinux.info:tdy
pkgname='weatherspect'
pkgver='2.0'
pkgrel='3'
pkgdesc='A virtual weather environment in ASCII'
arch=('any')
url="https://github.com/AnotherFoxGuy/$pkgname"
license=('GPL-2.0-only')
depends=('perl' 'perl-compass-points' 'perl-json' 'perl-term-animation')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-fix-w-bug.diff::$url/commit/b7ac28234c1e93e537787d163ac80361296aaf58.diff"
	'devendor.diff'
	"$pkgname.1"
)
sha512sums=('b459eeb93a2790ae9ed72f9fbd8a066de3adfb529c42739e8d4350809ee611d3f15c49b4930ba4e9b50d683030fd6c979fddf83074446007e80d5bbe85e2c2e2'
            '8102f7f325d5979ff78f721507aa0e7623a990fa73d311eebb3ba394945d42819ae91e7af5952fbf34373bff49da4e97afbe84a17b5e3e0f0159f9ea825cb686'
            '10e416693897551d3ab11b81f0a4d2d9df71957dd4b8abd780d9a09473d7fa7846867178760f95c5502c5fac3ee4089185ccf0edf8b1c937f17ffec32b530ca3'
            '494dcc31151912ae6965a6c7f6323f1c3fbfa01f1eadc72838e605917ab6a4df4aba95aab2a891070eb928817b35240eecfa3d6a4fc285ff8a4e729044968caa')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Devendor perl-compass-points
	patch  --forward -p1 < '../devendor.diff'

	# https://github.com/AnotherFoxGuy/weatherspect/commit/b7ac28234c1e93e537787d163ac80361296aaf58
	patch  --forward -p1 < "../$pkgname-$pkgver-fix-w-bug.diff"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "../$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
