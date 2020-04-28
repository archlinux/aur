# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-web_sanitize' 'lua51-web_sanitize' 'lua52-web_sanitize')
pkgver=1.0.0
pkgrel=1
pkgdesc="Lua library for sanitizing untrusted HTML"
arch=('x86_64')
url='https://github.com/leafo/web_sanitize'
license=('MIT')
makedepends=('luarocks' 'git')
source=("https://github.com/leafo/web_sanitize/archive/v${pkgver}.tar.gz")
sha256sums=('64da4fcfd2c025c250b6a91e1a26558c2d9265bb8f1f28d71f323ac55ec5eab3')

build() {
  mkdir -p 5.1 5.2 5.3

  # Build for 5.1
  (cd 5.1; luarocks build --pack-binary-rock --lua-version=5.1 --deps-mode=none .."/web_sanitize-${pkgver}/web_sanitize-dev-1.rockspec")
  # Build for 5.2
  (cd 5.2; luarocks build --pack-binary-rock --lua-version=5.2 --deps-mode=none .."/web_sanitize-${pkgver}/web_sanitize-dev-1.rockspec")
  # Build for 5.3
  (cd 5.3; luarocks build --pack-binary-rock --lua-version=5.3 --deps-mode=none .."/web_sanitize-${pkgver}/web_sanitize-dev-1.rockspec")
}

package_lua-web_sanitize() {
  pkgdesc='Web_sanitize for Lua 5.3'

  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.3/manifest"
}

package_lua51-web_sanitize() {
  pkgdesc='Web_sanitize for Lua 5.1'

  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.1/manifest"
}

package_lua52-web_sanitize() {
  pkgdesc='Web_sanitize for Lua 5.2'

  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/*.rock

  # remove luarocks-created root manifest
  rm "$pkgdir/usr/lib/luarocks/rocks-5.2/manifest"
}