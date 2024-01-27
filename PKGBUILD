# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='hlsdl'
pkgname="$_pkgname-git"
pkgver='0.27.r195.g84c1ded'
pkgrel='1'
pkgdesc='C program to download VoD HLS (.m3u8) files - git version'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/selsta/$_pkgname"
license=('MIT')
depends=('curl' 'openssl')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf '%s.r%s.g%s' "$(sed -nE 's/^.*hlsdl v([0-9.]*).*$/\1/p' 'src/misc.c')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
	install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
