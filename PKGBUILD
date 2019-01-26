# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=lua-luafilesystem
_rockname=luafilesystem
pkgver=1.7.0_2
_tag=${pkgver//./_}
_srcver=1.7.0-2
pkgrel=1
pkgdesc="File System Library for the Lua Programming Language"
arch=('i686' 'x86_64')
url="https://keplerproject.github.io/luafilesystem/"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("${_rockname}-${_tag}.tar.gz::https://github.com/keplerproject/luafilesystem/archive/v${_tag}.tar.gz")
md5sums=('5166c00df1599a54dc97e84852be7f0c')

build() {
  cd "$_rockname-$_tag"
  luarocks make --pack-binary-rock --deps-mode=none "rockspecs/$_rockname-$_srcver.rockspec"
}

package() {
  luarocks install --tree="$pkgdir/usr/" --deps-mode=none "$_rockname-$_tag"/*.rock
  find "$pkgdir/usr" -name manifest -delete
}
