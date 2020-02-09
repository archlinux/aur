# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-penlight-git
pkgver=1.7.0.r4.ge469fa0
pkgrel=1
pkgdesc='Lua libraries for on input data handling, functional programming, and OS interface'
url='https://tieske.github.io/Penlight'
arch=('any')
license=('MIT')
conflicts=('lua-penlight')
provides=('lua-penlight')
depends=('lua' 'lua-filesystem')
source=("${pkgname}::git+https://github.com/Tieske/Penlight.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags --abbrev=7 HEAD | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
