# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-middleclass' 'lua51-middleclass' 'lua52-middleclass')
_rockname=middleclass
pkgver=4.1.1
_rockver=4.1-0
pkgrel=1
pkgdesc="Object-orientation for Lua"
arch=('any')
url='https://github.com/kikito/middleclass'
license=('MIT')
makedepends=('luarocks')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kikito/middleclass/archive/v${pkgver}.tar.gz")
sha256sums=('d01e5af2a61eeb8c9533f8b3b0fa665bd8ad693c2b9fb297b20e3f9e16d85085')

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

package_lua-middleclass() {
  pkgdesc='Object-orientation for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/${_rockname}-${_rockver}.all.rock

  install -Dm644 "${srcdir}/${_rockname}-${pkgver}/MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-middleclass() {
  pkgdesc='Object-orientation for Lua 5.1'

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/${_rockname}-${_rockver}.all.rock

  install -Dm644 "${srcdir}/${_rockname}-${pkgver}/MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-middleclass() {
  pkgdesc='Object-orientation for Lua 5.2'

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/${_rockname}-${_rockver}.all.rock

  install -Dm644 "${srcdir}/${_rockname}-${pkgver}/MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}