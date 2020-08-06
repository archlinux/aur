# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Laszlo Papp <djszapi at archlinux us>
# Contributor: Donald Ephraim Curtis <dcurtis@gmail.com>

# Lua 5.3 (and now 5.4) versions are in [community], long standing bug report
# to add 5.1 and 5.2 has been ignored for > 6 months:
# https://bugs.archlinux.org/task/65389?project=5&string=lua-penlight

pkgbase=lua51-penlight
_pkgbase=Penlight
pkgname=('lua52-penlight' 'lua51-penlight')
pkgver=1.8.0
pkgrel=2
pkgdesc='Lua libraries for on input data handling, functional programming, and OS interface'
url="https://tieske.github.io/${_pkgbase}"
arch=('any')
license=('MIT')
_lua_deps=('filesystem')
checkdepends=('lua' "${_lua_deps[@]/#/lua-}")
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/Tieske/${_pkgbase}/archive/${pkgver}/${pkgver}.tar.gz")
sha256sums=('a1a41c5ec82c0459bc0508a0fb1cb56dfaa83a1dd7754d7174b336ad65420d3d')

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

package_lua52-penlight() {
  depends+=('lua52' "${_lua_deps[@]/#/lua52-}")
  _package_helper 5.2
}

package_lua51-penlight() {
  depends+=('lua51' "${_lua_deps[@]/#/lua51-}")
  _package_helper 5.1
}
