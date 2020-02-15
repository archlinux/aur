# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>

pkgbase=lua51-penlight
_pkgbase=Penlight
pkgname=('lua52-penlight' 'lua51-penlight')
pkgver=1.7.0
pkgrel=2
pkgdesc='Lua libraries for on input data handling, functional programming, and OS interface'
url="https://tieske.github.io/${_pkgbase}"
arch=('any')
license=('MIT')
_lua_deps=('filesystem')
checkdepends=('lua' 'lua-luacov' "${_lua_deps[@]/#/lua-}") # Luacov because of upstream bug since fixed, remove when bumping release
source=("https://github.com/Tieske/${_pkgbase}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('5b793fc93fa7227190e191e5b24a8f0ce9dd5958ccebe7a53842a58b5d46057f')

check() {
  cd ${_pkgbase}-${pkgver}
  export LUA_PATH="${PWD}/lua/?/init.lua;${PWD}/lua/?.lua;$(lua -e 'print(package.path)')"
  lua run.lua
}

_package_helper() {
  cd ${_pkgbase}-${pkgver}
  install -Dm 644 lua/pl/* -t "${pkgdir}/usr/share/lua/$1/pl"
  install -Dm 644 CONTRIBUTING.md CHANGELOG.md README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/manual/* -t "${pkgdir}/usr/share/doc/${pkgname}/manual"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# Lua 5.3 version is already in [community]
# package_lua-penlight() {
#   depends+=('lua' "${_lua_deps[@]/#/lua-}")
#   _package_helper 5.3
# }

package_lua52-penlight() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-penlight() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
