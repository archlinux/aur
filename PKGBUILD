# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>

_pkgname=lua-penlight
_pkgbase=Penlight
pkgname=lua51-penlight
pkgver=1.7.0
pkgrel=1
pkgdesc='Lua libraries for on input data handling, functional programming, and OS interface'
url="https://tieske.github.io/${_pkgbase}"
arch=('any')
license=('MIT')
depends=('lua51' 'lua51-filesystem')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Tieske/$_pkgbase/archive/$pkgver.tar.gz")
sha256sums=('5b793fc93fa7227190e191e5b24a8f0ce9dd5958ccebe7a53842a58b5d46057f')

check() {
	cd "$_pkgbase-$pkgver"
	export LUA_PATH="$PWD/lua/?/init.lua;$PWD/lua/?.lua;$(lua5.1 -e 'print(package.path)')"
	lua5.1 run.lua
}

package() {
	cd "$_pkgbase-$pkgver"
	install -Dm644 lua/pl/* -t "$pkgdir/usr/share/lua/5.1/pl"
	install -Dm644 CONTRIBUTING.md CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 docs/manual/* -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 examples/* -t "$pkgdir/usr/share/doc/$pkgname/examples"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
