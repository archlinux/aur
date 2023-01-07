# Maintainer: éclairevoyant
# Contributor: Adrián Pérez de Castro <aperez at igalia dot com>

_pkgname=torch7-cwrap
pkgname="$_pkgname-git"
pkgver=r35.dbd0a62
pkgrel=2
pkgdesc='Tool to aid wrapping C functions to be used from Lua'
arch=('any')
_gitname=cwrap
url="https://github.com/torch/$_gitname"
license=('custom')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git')
source=("git+$url")
b2sums=('SKIP')

pkgver() {
	cd $_gitname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_gitname
	for filename in *.lua; do
		install -Dm644 "$filename" "$pkgdir/usr/share/lua/5.1/cwrap/$filename"
	done
	install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
