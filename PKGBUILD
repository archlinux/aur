# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=colors
_project=lua-$_rockname
pkgname=("lua-$_rockname-git" "lua53-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=8.05.26.r7.gf373e79
pkgrel=4
pkgdesc='HSL Color Theory Computation in Lua'
arch=(any)
url="https://github.com/yuri/$_project"
license=(MIT)
makedepends=(git
             lua
             lua53
             lua52
             lua51
             luarocks)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_project"
	# repo has no tags, this is the commit of the last luarocks bump
	git tag 8.05.26 aedcd28a23a76f0072c4c60e87a7fa545162a3e6 ||:
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package() {
	cd "$_project"
	depends=("${pkgname%%-*}")
	provides=("${pkgname/-git}=$pkgver")
	conflicts=("${pkgname/-git}")
	luarocks --lua-version "$1" --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- rockspec
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

package_lua-colors-git() {
	_package 5.4
}

package_lua51-colors-git() {
	_package 5.1
}

package_lua52-colors-git() {
	_package 5.2
}

package_lua53-colors-git() {
	_package 5.3
}
