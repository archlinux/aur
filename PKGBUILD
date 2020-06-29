# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='hlsdl'
pkgname="$_pkgname-git"
pkgver='0.27.r187.gc14b0c9'
pkgrel='1'
pkgdesc='C program to download VoD HLS (.m3u8) files - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/selsta/$_pkgname"
license=('MIT')
depends=('curl' 'openssl')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

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
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
