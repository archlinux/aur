# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-loadconf' 'lua51-loadconf' 'lua52-loadconf')
_rockname=loadconf
pkgver=0.3.6
pkgrel=1
pkgdesc="Read love2d conf.lua files"
arch=('any')
url='https://github.com/Alloyed/loadconf'
license=('MIT')
makedepends=('luarocks')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Alloyed/loadconf/archive/v${pkgver}.tar.gz")
sha256sums=('07519bf6262158322d19492befa21934f19393fd5919f960e5e70463613399d8')

build() {
  mkdir -p 5.1 5.2 5.3

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../"${_rockname}-${pkgver}/${_rockname}-scm-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none ../"${_rockname}-${pkgver}/${_rockname}-scm-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../"${_rockname}-${pkgver}/${_rockname}-scm-1.rockspec")
}

package_lua-loadconf() {
  pkgdesc='Read love2d conf.lua files for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/${_rockname}-scm-1.all.rock

  install -Dm644 "${srcdir}/${_rockname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-loadconf() {
  pkgdesc='Read love2d conf.lua files for Lua 5.1'

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/${_rockname}-scm-1.all.rock

  install -Dm644 "${srcdir}/${_rockname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-loadconf() {
  pkgdesc='Read love2d conf.lua files for Lua 5.2'

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/${_rockname}-scm-1.all.rock

  install -Dm644 "${srcdir}/${_rockname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}
