# Maintainer: Jiří Klimeš <blueowl@centrum.cz>
# Contributor: Lennart Eichhorn <lennart@madmanfred.com>

pkgname=(lua-lyaml lua51-lyaml lua52-lyaml lua53-lyaml)
pkgver=6.2.8
pkgrel=1
pkgdesc='libYAML binding for Lua'
arch=(any)
url=http://github.com/gvvaughan/lyaml
license=('MIT')
depends=('luarocks' 'libyaml')
makedepends=('git' 'lua' 'lua51' 'lua52' 'lua53')
source=(git+https://github.com/gvvaughan/lyaml.git#branch=release-v${pkgver})
md5sums=(SKIP)


build() {
  mkdir -p 5.1 5.2 5.3 5.4
  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 ../lyaml/"lyaml-$pkgver-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 ../lyaml/"lyaml-$pkgver-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 ../lyaml/"lyaml-$pkgver-1.rockspec")
  # Build for 5.4
  (cd 5.4; luarocks build --pack-binary-rock --lua-version=5.4 ../lyaml/"lyaml-$pkgver-1.rockspec")
}

package_lua51-lyaml() {
  pkgdesc='libYAML binding for Lua 5.1'
  depends+=('lua51' 'lua51-std-normalize')
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" lyaml/LICENSE

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-lyaml() {
  pkgdesc='libYAML binding for Lua 5.2'
  depends+=('lua52' 'lua52-std-normalize')
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" lyaml/LICENSE

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}

package_lua53-lyaml() {
  pkgdesc='libYAML binding for Lua 5.3'
  depends+=('lua53' 'lua53-std-normalize')
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" lyaml/LICENSE

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua-lyaml() {
  pkgdesc='libYAML binding for Lua 5.4'
  depends+=('lua' 'lua-std-normalize')
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" lyaml/LICENSE

  luarocks install --lua-version=5.4 --tree="$pkgdir/usr/" --deps-mode=none 5.4/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.4/manifest"
}
