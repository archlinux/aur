# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-date' 'lua51-date' 'lua52-date')
pkgver=2.1.2
pkgrel=1
pkgdesc="Date & Time module for Lua 5.x"
arch=('x86_64')
url='http://tieske.github.io/date'
license=('MIT')
makedepends=('luarocks')
source=("https://github.com/Tieske/date/archive/version_${pkgver}.tar.gz")
sha256sums=('91fc16bda7e326eeeedad3ad9ac09a76fa238a5bec533ed9ac3c08d109580874')

build() {
  mkdir -p 5.1 5.2 5.3

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../date-version_${pkgver}/"date-$pkgver-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none ../date-version_${pkgver}/"date-$pkgver-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../date-version_${pkgver}/"date-$pkgver-1.rockspec")
}

package_lua-date() {
  pkgdesc='Date and Time module for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-date() {
  pkgdesc='Date and Time module for Lua 5.1'

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-date() {
  pkgdesc='Date and Time module for Lua 5.2'

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}