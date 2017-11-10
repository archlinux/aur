# Maintainer:  chetgurevitch <chetgurevitch @ protonmail . com>
# Contributor: Sven-Hendrik Haase <sh @ lutzhaase . com>
# Contributor: Florian Walch <florian+aur @ fwalch . com>

pkgbase='lua-mpack-git'
pkgname=('lua51-mpack-git')
#pkgname=('lua51-mpack-git' 'lua52-mpack-git' 'lua-mpack-git')
pkgver=1.0.6.r17.gef02522
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/libmpack/libmpack-lua"
license=('MIT')
makedepends=('libmpack' 'lua51')
#makedepends=('libmpack' 'lua51' 'lua52' 'lua')
source=("git+https://github.com/libmpack/libmpack-lua.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/libmpack-lua"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

# prepare() {
#   cp -r "libmpack-lua" "libmpack-lua-52"
#   cp -r "libmpack-lua" "libmpack-lua-53"
# }

build() {
  cd "${srcdir}/libmpack-lua"
  make USE_SYSTEM_LUA=YES \
    USE_SYSTEM_MPACK=YES \
    MPACK_LUA_VERSION=$(lua5.1 -v &> /dev/stdout | cut -d ' ' -f 2)

  # cd "${srcdir}/libmpack-lua-52"
  # make USE_SYSTEM_LUA=YES \
  #   USE_SYSTEM_MPACK=YES \
  #   MPACK_LUA_VERSION=$(lua5.2 -v | cut -d ' ' -f 2)

  # cd "${srcdir}/libmpack-lua-53"
  # make USE_SYSTEM_LUA=YES \
  #   USE_SYSTEM_MPACK=YES \
  #   MPACK_LUA_VERSION=$(lua -v | cut -d ' ' -f 2)
}

package_lua51-mpack-git() {
  depends=('libmpack' 'lua51')
  provides=("lua51-mpack=${pkgver}")
  conflicts=('lua51-mpack')
  cd "${srcdir}/libmpack-lua"

  make DESTDIR="${pkgdir}" \
    USE_SYSTEM_LUA=YES \
    USE_SYSTEM_MPACK=YES \
    MPACK_LUA_VERSION=$(lua5.1 -v &> /dev/stdout | cut -d ' ' -f 2) \
    install

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}

# package_lua52-mpack-git() {
#   depends=('libmpack' 'lua52')
#   provides=("lua52-mpack=${pkgver}")
#   conflicts=('lua52-mpack')
#   cd "${srcdir}/libmpack-lua-52"
# 
#   make DESTDIR="${pkgdir}" \
#     USE_SYSTEM_LUA=YES \
#     USE_SYSTEM_MPACK=YES \
#     MPACK_LUA_VERSION=$(lua5.2 -v | cut -d ' ' -f 2) \
#     install
#
#   install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
# }
# 
# package_lua-mpack-git() {
#   depends=('libmpack' 'lua')
#   provides=("lua-mpack=${pkgver}")
#   conflicts=('lua-mpack')
#   cd "${srcdir}/libmpack-lua-53"
# 
#   make DESTDIR="${pkgdir}" \
#     USE_SYSTEM_LUA=YES \
#     USE_SYSTEM_MPACK=YES \
#     MPACK_LUA_VERSION=$(lua -v | cut -d ' ' -f 2) \
#     install
#
#   install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
# }
