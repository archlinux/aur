# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cmark
_project=$_rockname-lua
pkgname=("lua-$_rockname-git" "lua53-$_rockname-git" "lua52-$_rockname-git" "lua51-$_rockname-git")
pkgver=0.29.0.r5.gefb3feb
_branch='master'
_rockrel=1
pkgrel=2
pkgdesc='Lua wrapper for libcmark, CommonMark Markdown parsing and rendering library'
arch=('x86_64' 'i686')
url="https://github.com/jgm/$_project"
license=('BSD')
makedepends=('git' 'lua' 'lua53' 'lua52' 'lua51' 'luarocks')
source=("git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$_project"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a "$_project"{,-5.1}
  cp -a "$_project"{,-5.2}
  cp -a "$_project"{,-5.3}
  cp -a "$_project"{,-5.4}
}

_package_helper() {
  cd "$_project-$1"
  sed -i Makefile \
      -e "s!--local make!--lua-version='$1' --tree='$pkgdir/usr/' make --deps-mode=none --no-manifest!"
  make rock
}

package_lua-cmark-git() {
  depends=('lua')
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.4
}

package_lua53-cmark-git() {
  depends=('lua53')
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.3
}

package_lua52-cmark-git() {
  depends=('lua52')
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.2
}

package_lua51-cmark-git() {
  depends=('lua51')
  provides=("${pkgname/-git}")
  conflicts=("${pkgname/-git}")
  _package_helper 5.1
}
