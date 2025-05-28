# Maintainer: Jim Philip <jimphilip394 at gmail dot com>

_pkgname=shit
pkgname=shit-git
pkgver=r68.85b984e
pkgrel=1
pkgdesc="Simple file server in Go (latest git)"
arch=('x86_64')
url="https://github.com/notwithering/shit"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	go build -trimpath -o "$_pkgname"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
