# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-cursors-git
_pkgname=Sweet-cursors
pkgver=r7.7b82442
pkgrel=1
pkgdesc="Sweet cursor theme: XCursor and KDE's SVG cursors"
arch=('any')
url="https://github.com/Gigas002/$_pkgname"
license=('GPL-3.0-only')
makedepends=('git' 'python' 'inkscape' 'xorg-xcursorgen')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	python3 build.py xcursor
	python3 build.py scalable
}

package() {
	cd "$srcdir/$_pkgname"
	install -d "$pkgdir/usr/share/icons"
	cp -a "$_pkgname" "$pkgdir/usr/share/icons/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
