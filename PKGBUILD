# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='orbterm'
pkgname="$_pkgname-git"
pkgver='0.3.6.r4.g4ffdd27'
pkgrel='1'
pkgdesc='Orbital Terminal, compatible with Redox and Linux - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.redox-os.org/redox-os/$_pkgname"
license=('MIT')
depends=('sdl2')
makedepends=('cargo' 'git' 'rust')
provides=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory"
	cargo build --release --locked
}

package() {
	cd "$srcdir/$_sourcedirectory"
	install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
