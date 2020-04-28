# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-sci' 'lua51-sci' 'lua52-sci')
pkgver=1.0.0.beta12
pkgrel=1
pkgdesc="Scientific Computing with LuaJIT"
arch=('x86_64')
url='https://scilua.org/'
license=('MIT')
depends=('luajit'
         'lua-xsys'
         'lua51-xsys'
         'lua52-xsys'
         'openblas-lapack')
makedepends=('luarocks')
source=("https://github.com/stepelu/lua-sci/archive/v${pkgver:0:5}-${pkgver:6}.tar.gz"
        'sci-1.0.0.beta12-1.rockspec')
sha256sums=('50785d4e1c0f18c4e54bce99569845b629b9f18f7585dbee64d8bd11ecc98528'
            '9ab11513ec2950db9a5369d0b57a08707ad64cc5f478bffcd3a0e63116d9715f')

prepare() {
  ln -s "${srcdir}/sci-1.0.0.beta12-1.rockspec" "lua-sci-${pkgver}"
}

build() {
  mkdir -p 5.1 5.2 5.3

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../"sci-$pkgver-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none ../"sci-$pkgver-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../"sci-$pkgver-1.rockspec")
}

package_lua-sci() {
  pkgdesc='Scientific Computing with LuaJIT for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-sci() {
  pkgdesc='Scientific Computing with LuaJIT for Lua 5.1'

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-sci() {
  pkgdesc='Scientific Computing with LuaJIT for Lua 5.2'

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}