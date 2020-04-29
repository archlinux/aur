# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-zip' 'lua51-zip' 'lua52-zip')
_rockname='lua-zip'
pkgver=0.2.0
_rockver=0.2-0
pkgrel=1
pkgdesc="Lua 5.1 interface to libzip"
arch=('x86_64')
url='https://github.com/brimworks/lua-zip'
license=('MIT')
depends=('libzip')
makedepends=('luarocks')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brimworks/lua-zip/archive/v${pkgver}.tar.gz")
sha256sums=('b0238402c37e2a06994017940a35968dcde614ffaa8119fb8dabf30a9ad6741a')

prepare() {
  mv "${srcdir}/${_rockname}-${pkgver}/rockspecs/${_rockname}-${_rockver}.rockspec" "${srcdir}/${_rockname}-${pkgver}"
}

build() {
  mkdir -p 5.1 5.2 5.3

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../"${_rockname}-${pkgver}/${_rockname}-${_rockver}.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none ../"${_rockname}-${pkgver}/${_rockname}-${_rockver}.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../"${_rockname}-${pkgver}/${_rockname}-${_rockver}.rockspec")
}

package_lua-zip() {
  pkgdesc="Lua 5.1 interface to libzip for Lua 5.3"

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/${_rockname}-${_rockver}.linux-x86_64.rock

  head -n 27 "${srcdir}/${_rockname}-${pkgver}/README.txt" > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-zip() {
  pkgdesc="Lua 5.1 interface to libzip for Lua 5.1"

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/${_rockname}-${_rockver}.linux-x86_64.rock

  head -n 27 "${srcdir}/${_rockname}-${pkgver}/README.txt" > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-zip() {
  pkgdesc="Lua 5.1 interface to libzip for Lua 5.2"

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/${_rockname}-${_rockver}.linux-x86_64.rock

  head -n 27 "${srcdir}/${_rockname}-${pkgver}/README.txt" > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}