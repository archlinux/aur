# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-xsys' 'lua51-xsys' 'lua52-xsys')
pkgver=1.0.2
pkgrel=1
pkgdesc="LuaJIT General Purpose Routines"
arch=('x86_64')
url='http://scilua.org/xsys.html'
license=('MIT')
depends=('luajit')
makedepends=('luarocks')
source=("https://github.com/stepelu/lua-xsys/archive/v${pkgver}.tar.gz"
        'xsys-1.0.2-1.rockspec')
sha256sums=('d0e33e62f090772e3082a51c41da7014d95c0f8b81613f456008c3b7cca599ff'
            'd1ea0ef2f647e17af152d628396b74b740b5ab0305b7858f0237d205490f43fa')

prepare() {
  ln -s "${srcdir}/xsys-1.0.2-1.rockspec" "lua-xsys-${pkgver}"
}

build() {
  mkdir -p 5.1 5.2 5.3

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../"xsys-$pkgver-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none ../"xsys-$pkgver-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../"xsys-$pkgver-1.rockspec")
}

package_lua-xsys() {
  pkgdesc='LuaJIT General Purpose Routines for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-xsys() {
  pkgdesc='LuaJIT General Purpose Routines for Lua 5.1'

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-xsys() {
  pkgdesc='LuaJIT General Purpose Routines for Lua 5.2'

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}