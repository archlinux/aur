# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cldr
_project=cldr-lua
pkgname=("lua-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=0.0.0.r3.gd6e38e1
_branch='master'
_rockrel=0
pkgrel=3
pkgdesc='Unicode CLDR data and Lua interface.'
arch=('any')
url="https://github.com/alerque/$_project"
license=('MIT')
makedepends=('luarocks')
source=("git://github.com/alerque/$_project.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$_project"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_package_helper() {
  cd "$_project"
  luarocks --lua-version="$1" --tree="$pkgdir/usr/" make --deps-mode=none --no-manifest "$_rockname-scm-$_rockrel.rockspec"
}

package_lua-cldr-git() {
  depends+=('lua')
  conflicts+=('lua-cldr')
  _package_helper 5.3
}

package_lua52-cldr-git() {
  depends+=('lua52')
  conflicts+=('lua52-cldr')
  _package_helper 5.2
}

package_lua51-cldr-git() {
  depends+=('lua51')
  conflicts+=('lua51-cldr')
  _package_helper 5.1
}
