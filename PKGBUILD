# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_lua_version=5.2
_lua_version_nodot=${_lua_version//./}
pkgname=scansion-hg
pkgver=r168+.873f6fec12f2+
pkgrel=2
pkgdesc="Automated XMPP testing tool"
arch=('any')
url="https://matthewwild.co.uk/projects/scansion/"
license=('TODO')
depends=("lua${_lua_version_nodot}"
         "lua${_lua_version_nodot}-cjson"
         "lua${_lua_version_nodot}-expat"
         "lua${_lua_version_nodot}-sec"
         "lua${_lua_version_nodot}-socket"
         "lua${_lua_version_nodot}-filesystem")
source=('hg+https://code.matthewwild.co.uk/scansion/')
md5sums=('SKIP')

pkgver() {
  cd scansion
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd scansion
  sed -i -e 's,a:write("#!/usr/bin/env lua,a:write("#!/usr/bin/env lua5.2,' buildscripts/squish
}

build() {
  cd scansion
  ./configure --prefix=/usr
  make
}

package() {
  cd scansion
  install -Dm755 build/scansion "$pkgdir"/usr/bin/scansion

  install -dm755 "$pkgdir"/usr/share/scansion
  install -Dm644 scripts/* "$pkgdir"/usr/share/scansion/
}

# vim:set ts=2 sw=2 et:
