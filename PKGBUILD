# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=ldoc-git
_pkgname=${pkgname%-git}
pkgver=1.4.6.r52.gbbd498a
pkgrel=1
pkgdesc='LuaDoc-compatible documentation generation system'
arch=(any)
url=https://github.com/lunarmodules/LDoc
license=(MIT)
depends=(lua
         lua-penlight)
makedepends=(git)
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --abbrev=7 --tags |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${_pkgname}"
	install -dm0755 "$pkgdir/usr/share/lua/5.4"
	cp -a ldoc "$pkgdir/usr/share/lua/5.4"
	install -Dm0755 -t "$pkgdir/usr/bin/" ldoc.lua
	ln -s ldoc.lua "$pkgdir/usr/bin/ldoc"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md doc/doc.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYRIGHT
}
