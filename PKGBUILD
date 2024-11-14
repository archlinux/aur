# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgbase=libastal-lua-git
pkgname=("libastal-lua-git" "libastal-lua51-git" "libastal-lua53-git")
pkgver=r580.d538d8e
pkgrel=1
pkgdesc="Lua bindings for libastal."
arch=("x86_64")
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
makedepends=(
  "git"
  "lua-lgi" "lua51" "lua51-lgi" "lua53" "lua53-lgi"
  "luarocks")
depends=("libastal-git" "libastal-4-git")
groups=("libastal")
provides=(libastal-lua)
source=("git+${url}.git")
sha256sums=('SKIP')
_rockname=astal-dev-1.rockspec

pkgver(){
  cd astal
  # git describe --long --tags --abbrev=7 | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_package_lua() {
  cd astal/lang/lua
	luarocks --lua-version $1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- "$_rockname"
}

package_libastal-lua-git() {
	depends=("lua" "lua-lgi")
  pkgdesc="lua bindings for libstal."
  _package_lua 5.4
}

package_libastal-lua51-git() {
	depends=("lua51" "lua51-lgi")
  pkgdesc="lua bindings for libstal."
  _package_lua 5.1
}

package_libastal-lua53-git() {
	depends=("lua53" "lua53-lgi")
  pkgdesc="lua bindings for libstal."
  _package_lua 5.3
}
