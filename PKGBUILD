# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='hlsdl'
pkgver='0.27'
_commit='cbf4301a912a3c0bbb418bd92b861f390f9c519c'
pkgrel='2'
pkgdesc='C program to download VoD HLS (.m3u8) files'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/selsta/$pkgname"
license=('MIT')
depends=('curl' 'openssl')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('54b03ea793a08d409d7764ab9c7b40b7a925c2cce95dfd5efd701d45814f9824334d285641bb355f8d00d5f710aadf976d933428dd5c23f027190f8cc59ffc5a')

_sourcedirectory="$pkgname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	# see https://bbs.archlinux.org/viewtopic.php?id=255727
	CFLAGS="$CFLAGS -fcommon"
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
