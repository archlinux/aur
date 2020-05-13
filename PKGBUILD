# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=fluent
_project=$_rockname-lua
pkgname=("lua-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=0.0.4.r69.g690b347
_branch='master'
_rockrel=0
pkgrel=2
pkgdesc='Lua implementation of Project Fluent'
arch=('any')
url="https://github.com/alerque/$_project"
license=('MIT')
_lua_deps=('cldr' 'epnf' 'penlight')
makedepends=('git' 'lua' 'lua52' 'lua51' 'luarocks')
source=("git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$_project"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package_helper() {
  cd "$_project"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" \
    make --deps-mode=none --no-manifest "$_rockname-scm-$_rockrel.rockspec"
}

package_lua-fluent-git() {
  depends=('lua' "${_lua_deps[@]/#/lua-}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.3
}

package_lua52-fluent-git() {
  depends=('lua52' "${_lua_deps[@]/#/lua52-}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.2
}

package_lua51-fluent-git() {
  depends=('lua51' "${_lua_deps[@]/#/lua51-}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.1
}
