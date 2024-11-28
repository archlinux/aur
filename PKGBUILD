_pkgname=xml2lua
pkgbase=lua-${_pkgname}
pkgname=(lua{51,52,53,}-$_pkgname)
pkgver=1.6_2
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
sha512sums=('c5131004281257259211cfaa933bd1d158ee4caa136d6374fc3b202198dead104eb57ff42b2e14bb38beec26b248f871767f886df8b10f823d537ae27479c896')

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
