pkgname=openresty_luafilesystem
pkgver=1.6.3
_pkgver=v_${pkgver//./_}
pkgrel=2
pkgdesc="File System Library for the Lua Programming Language in Openresty"
arch=('any')
url="https://keplerproject.github.io/luafilesystem/"
license=('custom')
depends=('openresty_luarocks')
install=rock.install
source=(https://github.com/keplerproject/luafilesystem/archive/$_pkgver.tar.gz)
noextract=()
sha256sums=('5525d2b8ec7774865629a6a29c2f94cb0f7e6787987bf54cd37e011bfb642068')

build() {
  cd "$srcdir/luafilesystem-$_pkgver"
  /opt/openresty/luajit/bin/luajit-2.1.0-alpha /opt/openresty/luajit/bin/luarocks make --pack-binary-rock rockspecs/luafilesystem-1.6.3-1.rockspec
}

package() {
  cd "$srcdir/luafilesystem-$_pkgver"
  mkdir -p "${pkgdir}/opt/openresty/luajit"
  /opt/openresty/luajit/bin/luajit-2.1.0-alpha /opt/openresty/luajit/bin/luarocks --to="${pkgdir}/opt/openresty/luajit" install --deps-mode=none --keep *.rock
  rm -- "${pkgdir}/opt/openresty/luajit/lib/luarocks/rocks/manifest"
}
# vim:set ts=2 sw=2 et:
