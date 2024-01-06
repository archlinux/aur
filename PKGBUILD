# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=combustion
pkgname=("lua-$_rockname-git" "lua53-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=r60.4294fca
pkgrel=1
_rockrel=2
pkgdesc='pack any lua project (including dependencies) into a single executable'
arch=(x86_64)
url="https://github.com/Frityet/$_rockname"
license=(MIT)
_luadeps=(argparse
          filesystem
          penlight)
makedepends=(git
             lua
             lua51
             lua52
             lua53
             luarocks)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_rockname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_package() {
	cd "$_rockname"
	luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-dev-$_rockrel.rockspec"
	mv "$pkgdir/usr/bin/combust"{,"-$1"}
	find "$pkgdir/usr/bin" -type f -execdir sed -i -e "s#$pkgdir##" {} \;
}

package_lua-combustion-git() {
	depends=('lua' "${_luadeps[@]/#/lua-}")
	provides=("${pkgname/-git}")
	conflicts=("${pkgname/-git}")
	_package 5.4
}

package_lua53-combustion-git() {
	depends=('lua53' "${_luadeps[@]/#/lua53-}")
	provides=("${pkgname/-git}")
	conflicts=("${pkgname/-git}")
	_package 5.3
}

package_lua52-combustion-git() {
	depends=('lua52' "${_luadeps[@]/#/lua52-}")
	provides=("${pkgname/-git}")
	conflicts=("${pkgname/-git}")
	_package 5.2
}

package_lua51-combustion-git() {
	depends=('lua51' "${_luadeps[@]/#/lua51-}")
	provides=("${pkgname/-git}")
	conflicts=("${pkgname/-git}")
	_package 5.1
}
