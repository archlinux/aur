# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

_pkgname=penlight
pkgname=("lua-$_pkgname-git" "lua53-$_pkgname-git" "lua52-$_pkgname-git" "lua51-$_pkgname-git")
pkgver=1.8.0.r0.g76079c1
pkgrel=1
pkgdesc='Lua libraries for on input data handling, functional programming, and OS interface'
url='https://tieske.github.io/Penlight'
arch=('any')
license=('MIT')
_lua_deps=('filesystem')
makedepends=('lua' 'lua53' 'lua52' 'lua51')
checkdepends=('lua' "${_lua_deps[@]/#/lua-}")
source=("$_pkgname::git+https://github.com/Tieske/Penlight.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 HEAD |
    sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "$_pkgname"
  export LUA_PATH="$PWD/lua/?/init.lua;$PWD/lua/?.lua;$(lua -e 'print(package.path)')"
  lua run.lua
}

_package_helper() {
  cd "$_pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/lua/$1/pl" lua/pl/*
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" CONTRIBUTING.md CHANGELOG.md README.md
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/manual/" docs/manual/*
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" examples/*
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
}

package_lua-penlight-git() {
  depends+=('lua' "${_lua_deps[@]/#/lua-}")
  provides=("${pkgname/%-git}")
  conflicts=("${pkgname/%-git}")
  _package_helper 5.4
}

package_lua53-penlight-git() {
  depends+=('lua53' "${_lua_deps[@]/#/lua53-}")
  provides=("${pkgname/%-git}")
  conflicts=("${pkgname/%-git}")
  _package_helper 5.3
}

package_lua52-penlight-git() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  provides=("${pkgname/%-git}")
  conflicts=("${pkgname/%-git}")
  _package_helper 5.2
}

package_lua51-penlight-git() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  provides=("${pkgname/%-git}")
  conflicts=("${pkgname/%-git}")
  _package_helper 5.1
}
