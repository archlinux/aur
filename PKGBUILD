# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lua51-moonscript
_pkgname=moonscript
pkgver=0.2.6
pkgrel=1
pkgdesc="Dynamic scripting language that compiles into Lua (5.1)"
arch=('any')
url='http://moonscript.org/'
license=('MIT')
depends=('lua51-filesystem' 'lua51-alt-getopt' 'lua51-lpeg')
conflicts=('moonscript')
source=("https://github.com/leafo/moonscript/archive/v${pkgver}.tar.gz")
sha256sums=('ed9dc2508f036dbc4571d5b654a73363ff71fe1045c6ee6456654e94d476e1e6')

prepare() {
  rm -fr build
  cp -r "${_pkgname}-${pkgver}" build
  cd build

  sed 's|#!/usr/bin/env lua|#!/usr/bin/env lua5.1|g' -i bin/moon -i bin/moonc
}

package() {
  cd build
  install -Dm755 bin/moon "${pkgdir}/usr/bin/moon5.1"
  install -Dm755 bin/moonc "${pkgdir}/usr/bin/moonc5.1"

  install -Dm644 moon/init.lua "${pkgdir}/usr/share/lua/5.1/moon/init.lua"
  install -Dm644 moon/all.lua "${pkgdir}/usr/share/lua/5.1/moon/all.lua"
  install -Dm644 moon/init.lua "${pkgdir}/usr/share/lua/5.1/moon/init.lua"
  install -Dm644 moonscript/base.lua "${pkgdir}/usr/share/lua/5.1/moonscript/base.lua"
  install -Dm644 moonscript/compile.lua "${pkgdir}/usr/share/lua/5.1/moonscript/compile.lua"
  install -Dm644 moonscript/compile/statement.lua "${pkgdir}/usr/share/lua/5.1/moonscript/compile/statement.lua"
  install -Dm644 moonscript/compile/value.lua "${pkgdir}/usr/share/lua/5.1/moonscript/compile/value.lua"
  install -Dm644 moonscript/data.lua "${pkgdir}/usr/share/lua/5.1/moonscript/data.lua"
  install -Dm644 moonscript/dump.lua "${pkgdir}/usr/share/lua/5.1/moonscript/dump.lua"
  install -Dm644 moonscript/errors.lua "${pkgdir}/usr/share/lua/5.1/moonscript/errors.lua"
  install -Dm644 moonscript/init.lua "${pkgdir}/usr/share/lua/5.1/moonscript/init.lua"
  install -Dm644 moonscript/line_tables.lua "${pkgdir}/usr/share/lua/5.1/moonscript/line_tables.lua"
  install -Dm644 moonscript/parse.lua "${pkgdir}/usr/share/lua/5.1/moonscript/parse.lua"
  install -Dm644 moonscript/transform.lua "${pkgdir}/usr/share/lua/5.1/moonscript/transform.lua"
  install -Dm644 moonscript/transform/destructure.lua "${pkgdir}/usr/share/lua/5.1/moonscript/transform/destructure.lua"
  install -Dm644 moonscript/transform/names.lua "${pkgdir}/usr/share/lua/5.1/moonscript/transform/names.lua"
  install -Dm644 moonscript/types.lua "${pkgdir}/usr/share/lua/5.1/moonscript/types.lua"
  install -Dm644 moonscript/util.lua "${pkgdir}/usr/share/lua/5.1/moonscript/util.lua"
  install -Dm644 moonscript/version.lua "${pkgdir}/usr/share/lua/5.1/moonscript/version.lua"

  install -Dm644 docs/reference.md "${pkgdir}/usr/share/doc/${pkgname}/reference.md"
  install -Dm644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
