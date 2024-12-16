# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cmark
_project=$_rockname-lua
pkgname=("lua-$_rockname" "lua53-$_rockname" "lua52-$_rockname" "lua51-$_rockname")
pkgver=0.31.1
_rockrel=1
pkgrel=1
pkgdesc='Lua wrapper for libcmark, CommonMark Markdown parsing and rendering library'
arch=(x86_64 i686)
url="https://github.com/jgm/$_project"
license=(BSD)
makedepends=(lua lua53 lua52 lua51 luarocks)
source=("$_rockname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2cac08b6ea39f0a824980df788990117cd6244cff74de53fa61fec07547d0686')

prepare() {
  cp -a "$_project-$pkgver"{,-5.4}
  cp -a "$_project-$pkgver"{,-5.3}
  cp -a "$_project-$pkgver"{,-5.2}
  cp -a "$_project-$pkgver"{,-5.1}
}

_package() {
  cd "$_project-$pkgver-$1"
  sed -i Makefile \
      -e "s!--local make!--lua-version='$1' --tree='$pkgdir/usr/' make --deps-mode=none --no-manifest!"
  make rock
}

package_lua-cmark() {
  depends=('lua')
  _package 5.4
}

package_lua53-cmark() {
  depends=('lua53')
  _package 5.3
}

package_lua52-cmark() {
  depends=('lua52')
  _package 5.2
}

package_lua51-cmark() {
  depends=('lua51')
  _package 5.1
}
