# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-discount' 'lua51-discount' 'lua52-discount' 'lua53-discount')
pkgver=0.4
pkgrel=1
pkgdesc="Lua bindings for the Discount Markdown library"
arch=('x86_64')
url='https://github.com/craigbarnes/lua-discount'
license=('ISC')
depends=('discount')
makedepends=('luarocks')
source=("https://github.com/craigbarnes/lua-discount/archive/${pkgver}.tar.gz"
        "https://luarocks.org/manifests/craigb/discount-${pkgver}-1.rockspec"
        'LICENSE::https://github.com/craigbarnes/lua-discount/raw/master/LICENSE')
sha256sums=('3531eeddde4a89d5b7a4ab9b359a7f01a88ac85dd4fac61554eb199165cfdead'
            'edb216e8a28534f18d8950779b50dab083c8f339eaed90b68814b97c27af8255'
            '8b2fffc6b27a33bf6958a2a2293ce19ce5cbd7206ccb6dda7a9d3abe6f80c9fa')

prepare() {
  if [[ -f "${srcdir}/lua-discount-${pkgver}/discount-${pkgver}-1.rockspec" ]]; then
    rm "${srcdir}/lua-discount-${pkgver}/discount-${pkgver}-1.rockspec"
  fi
  ln -s "${srcdir}/discount-${pkgver}-1.rockspec" "${srcdir}/lua-discount-${pkgver}/"
}

build() {
  mkdir -p 5.1 5.2 5.3 5.4

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none ../lua-discount-${pkgver}/"discount-$pkgver-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none ../lua-discount-${pkgver}/"discount-$pkgver-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none ../lua-discount-${pkgver}/"discount-$pkgver-1.rockspec")
  # Build for 5.4
  (cd 5.4; luarocks build --pack-binary-rock --lua-version=5.4 --deps-mode=none ../lua-discount-${pkgver}/"discount-$pkgver-1.rockspec")
}

package_lua-discount() {
  pkgdesc='Lua bindings for the Discount Markdown library for Lua 5.4'

  luarocks install --lua-version=5.4 --tree="$pkgdir/usr/" --deps-mode=none 5.4/*.rock
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.4/manifest"
}

package_lua53-discount() {
  pkgdesc='Lua bindings for the Discount Markdown library for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-discount() {
  pkgdesc='Lua bindings for the Discount Markdown library for Lua 5.1'

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-discount() {
  pkgdesc='Lua bindings for the Discount Markdown library for Lua 5.2'

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/*.rock
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}