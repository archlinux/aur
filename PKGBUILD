# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cmark
_project=$_rockname-lua
pkgname=("lua-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.29.0
_rockrel=1
pkgrel=1
pkgdesc='Lua wrapper for libcmark, CommonMark Markdown parsing and rendering library'
arch=('x86_64' 'i686')
url="https://github.com/jgm/$_project"
license=('BSD')
makedepends=('lua' 'lua52' 'lua51' 'luarocks')
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('44965157b8c306324547fd75938fb97ff958f443219b4611d6823dd1daa1d6e2')

prepare() {
  cp -a "$_project-$pkgver"{,-5.1}
  cp -a "$_project-$pkgver"{,-5.2}
  cp -a "$_project-$pkgver"{,-5.3}
}

_package_helper() {
  cd "$_project-$pkgver-$1"
  sed -i Makefile \
      -e "s!--local make!--lua-version='$1' --tree='$pkgdir/usr/' make --deps-mode=none --no-manifest!"
  make rock
}

package_lua-cmark() {
  depends=('lua')
  _package_helper 5.3
}

package_lua52-cmark() {
  depends=('lua52')
  _package_helper 5.2
}

package_lua51-cmark() {
  depends=('lua51')
  _package_helper 5.1
}
