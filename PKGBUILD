# Maintainer:  chetgurevitch <chetgurevitch @ protonmail . com>
# Contributor: Sven-Hendrik Haase <sh @ lutzhaase . com>
# Contributor: Florian Walch <florian+aur @ fwalch . com>

pkgbase='lua-mpack-git'
_gitname='libmpack-lua'
pkgname=('lua51-mpack-git')
#pkgname=('lua51-mpack-git' 'lua52-mpack-git' 'lua-mpack-git')
pkgver=1.0.6.r4.g5d34594
pkgrel=2
arch=('any')
url="https://github.com/libmpack/${_gitname}"
license=('MIT')
makedepends=('libmpack' 'lua51')
#makedepends=('libmpack' 'lua51' 'lua52' 'lua')
source=("${_gitname}-git::git+https://github.com/libmpack/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}-git"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#   cp -r "${_gitname}-git" "${_gitname}52-git"
#   cp -r "${_gitname}-git" "${_gitname}53-git"
# }

build() {
  cd "${srcdir}/${_gitname}-git"
  make USE_SYSTEM_LUA=YES \
    USE_SYSTEM_MPACK=YES \
    MPACK_LUA_VERSION=5.1

  # cd "${srcdir}/${_gitname}52-git"
  # make USE_SYSTEM_LUA=YES \
  #   USE_SYSTEM_MPACK=YES \
  #   MPACK_LUA_VERSION=5.2

  # cd "${srcdir}/${_gitname}53-git"
  # make USE_SYSTEM_LUA=YES \
  #   USE_SYSTEM_MPACK=YES \
  #   MPACK_LUA_VERSION=5.3
}

package_lua51-mpack-git() {
  depends=('libmpack' 'lua51')
  provides=("lua51-mpack=${pkgver}")
  conflicts=('lua51-mpack')
  cd "${srcdir}/${_gitname}-git"

  make DESTDIR="${pkgdir}" \
    USE_SYSTEM_LUA=YES \
    USE_SYSTEM_MPACK=YES \
    MPACK_LUA_VERSION=5.1 \
    install
}

# package_lua52-mpack-git() {
#   depends=('libmpack' 'lua52')
#   provides=("lua52-mpack=${pkgver}")
#   conflicts=('lua52-mpack')
#   cd "${srcdir}/${_gitname}52-git"
# 
#   make DESTDIR="${pkgdir}" \
#     USE_SYSTEM_LUA=YES \
#     USE_SYSTEM_MPACK=YES \
#     MPACK_LUA_VERSION=5.2 \
#     install
# }
# 
# package_lua-mpack-git() {
#   depends=('libmpack' 'lua')
#   provides=("lua-mpack=${pkgver}")
#   conflicts=('lua-mpack')
#   cd "${srcdir}/${_gitname}53-git"
# 
#   make DESTDIR="${pkgdir}" \
#     USE_SYSTEM_LUA=YES \
#     USE_SYSTEM_MPACK=YES \
#     MPACK_LUA_VERSION=5.3 \
#     install
# }
