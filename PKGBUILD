# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-ansicolors' 'lua51-ansicolors' 'lua52-ansicolors')
_rockname=ansicolors
_rockver=1.0
pkgver=1.0.2
pkgrel=1
pkgdesc="ANSI terminal color manipulation for Lua"
arch=('x86_64')
url='https://github.com/kikito/ansicolors.lua'
license=('MIT')
makedepends=('luarocks')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kikito/ansicolors.lua/archive/v${pkgver}.tar.gz")
sha256sums=('fa76a465c2e0d342f6d5a1d44c63bd398053f206f41c7b5356b551694f899d64')

prepare() {
  sed -i '4s|.*|url = "https://github.com/kikito/ansicolors.lua/archive/v1.0.2.tar.gz",|' "${srcdir}/ansicolors.lua-$pkgver/${_rockname}-$_rockver-1.rockspec"

  sed -i '4 a   dir = "ansicolors.lua-1.0.2"' "${srcdir}/${_rockname}.lua-$pkgver/${_rockname}-$_rockver-1.rockspec"
}

build() {
  mkdir -p 5.1 5.2 5.3

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../"${_rockname}.lua-$pkgver/${_rockname}-${_rockver}-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none ../"${_rockname}.lua-$pkgver/${_rockname}-${_rockver}-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../"${_rockname}.lua-$pkgver/${_rockname}-${_rockver}-1.rockspec")
}

package_lua-ansicolors() {
  pkgdesc='ANSI terminal color manipulation for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/${_rockname}-${_rockver}-1.all.rock

  install -Dm644 "${srcdir}/${_rockname}.lua-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.1'
  
  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/${_rockname}-${_rockver}-1.all.rock

  install -Dm644 "${srcdir}/${_rockname}.lua-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.2'
  
  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/${_rockname}-${_rockver}-1.all.rock

  install -Dm644 "${srcdir}/${_rockname}.lua-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}