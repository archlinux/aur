# Maintainer: dreamscached <dreamscache.d@gmail.com>
# shellcheck shell=bash disable=SC2164,SC2154,SC2034

_pkgname=tile-gaps
_scriptname=tilegaps

pkgname="kwin-$_pkgname-git"
pkgdesc="KWin script to add space around windows touching a screen edge or other window"
url="https://github.com/ccatterina/tile-gaps"
pkgver=r267.a14a500
pkgrel=1
arch=(any)
source=("$_pkgname::git+$url.git#branch=plasma-6-port")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "metadata.json" "$pkgdir/usr/share/kwin/scripts/$_scriptname/metadata.json"
	mkdir -m 755 "$pkgdir/usr/share/kwin/scripts/tilegaps/contents"
	find "contents" -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/kwin/scripts/$_scriptname/{}" \;
}
