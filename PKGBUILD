# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-cursors-hyprcursor-git
_reponame=Sweet-cursors
_pkgname=Sweet-cursors-hyprcursor
pkgver=r7.7b82442
pkgrel=1
pkgdesc="Sweet cursor theme for hyprcursor"
arch=('any')
url="https://github.com/Gigas002/$_reponame"
license=('GPL-3.0-only')
makedepends=('git' 'python' 'inkscape' 'hyprcursor')
depends=('hyprcursor')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$_reponame::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_reponame"
	python3 build.py hyprcursor
}

package() {
	cd "$srcdir/$_reponame"
	install -d "$pkgdir/usr/share/icons"
	cp -a "$_pkgname" "$pkgdir/usr/share/icons/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
