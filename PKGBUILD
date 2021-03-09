_pkgname=xml2lua
pkgbase=lua-${_pkgname}
pkgname=(lua{51,52,53,}-$_pkgname)
pkgver=1.4_5
pkgrel=1
pkgdesc="use xml in lua"
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
makedepends=('luarocks'
             # https://github.com/luarocks/luarocks/issues/1275
             'lua51'
             'lua52'
             'lua53'
             'lua')
source=("https://github.com/manoelcampos/xml2lua/archive/v${pkgver/_/-}.tar.gz")
md5sums=('d3b394fc6bf1a9f139b6f6f87f2bc7f2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver/_/-}"
  for v in 5.1 5.2 5.3 5.4; do
    mkdir -p "$v/"
    luarocks make --pack-binary-rock --lua-version="$v" --deps-mode=none \
      CFLAGS="$CPPFLAGS $CFLAGS -fPIC" \
      LIBFLAG="$LDFLAGS -shared" \
      ${_pkgname}-"${pkgver/_/-}".rockspec
    mv ${_pkgname}-"${pkgver/_/-}".*.rock "$v/"
  done
}

package_lua51-xml2lua() {
  pkgdesc="$pkgdesc for Lua 5.1"

  cd "${srcdir}/${_pkgname}-${pkgver/_/-}"
  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none 5.1/*.rock --no-manifest
}

package_lua52-xml2lua() {
  pkgdesc="$pkgdesc for Lua 5.2"

  cd "${srcdir}/${_pkgname}-${pkgver/_/-}"
  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none 5.2/*.rock --no-manifest
}

package_lua53-xml2lua() {
  pkgdesc="$pkgdesc for Lua 5.3"

  cd "${srcdir}/${_pkgname}-${pkgver/_/-}"
  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none 5.3/*.rock --no-manifest
}

package_lua-xml2lua() {
  pkgdesc="$pkgdesc for Lua 5.4"

  cd "${srcdir}/${_pkgname}-${pkgver/_/-}"
  luarocks install --lua-version=5.4 --tree="$pkgdir/usr/" --deps-mode=none 5.4/*.rock --no-manifest
}
