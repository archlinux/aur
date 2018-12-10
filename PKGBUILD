# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=lua-penlight-git
pkgver=1.5.4.r43.gee381b7
pkgrel=1
pkgdesc='A set of pure Lua libraries focusing on input data handling, functional programming, and OS path management'
url='https://github.com/stevedonovan/Penlight'
arch=('any')
license=('MIT')
conflicts=('lua-penlight')
provides=('lua-penlight')
depends=('bash' 'lua' 'lua-filesystem')
source=("${pkgname}::git+https://github.com/stevedonovan/Penlight.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Prefix revision with 'r'; replace all '-' with '.'
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname}
  install -dm644              "${pkgdir}/usr/share/doc/${pkgname}/" # Create doc directory
  cp -a docs/manual examples  "${pkgdir}/usr/share/doc/${pkgname}/" # Copy documentation and examples into doc/
  cp -a config.ld             "${pkgdir}/usr/share/doc/${pkgname}/" # Copy config.ld to examples
  install -DTpm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" # Copy license file and create directory

  luaversion=`lua -v | awk '{print tolower($1$2)}' | sed -r 's/lua([0-9]\.[0-9]).*/\1/g'`
  mkdir -p       "${pkgdir}/usr/share/lua/${luaversion}/pl"
  cp -a lua/pl/* "${pkgdir}/usr/share/lua/${luaversion}/pl"
}
