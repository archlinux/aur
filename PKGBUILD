# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_platform="ps2"
_target="mipsel-${_platform}"
_base="sdk"
pkgname="${_platform}-${_base}"
pkgver=v1.0
pkgrel=1
_pkgdesc=("Homebrew Sony Playstation® 2 videogame system SDK.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('BSD')
_github="https://github.com/ps2dev"
_local="ssh://git@127.0.0.1:/home/git"
url="${_github}/${_platform}${_base}"
depends=("${_platform}-"{"dvp","iop"})
         # "${_platform}-ee")
optdepends=()
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

build() {
  ls

  export CFLAGS=""
  local _cflags=(-I/usr/mips64r5900el-ps2-elf/include/pthread-embedded
                 -L/usr/mips64r5900el-ps2-elf/lib/pthread-embedded)

  local _build_opts=(CFLAGS="${_cflags[*]}")

  export CFLAGS="${_cflags[*]}"
  export CPPFLAGS="${_cflags[*]}"

  cd "${srcdir}/${pkgname}"
  CFLAGS="${_cflags[*]}" \
  CPPFLAGS="${_cflags[*]}" \
  make "${_build_opts[@]}"
}

# shellcheck disable=SC2154
package() {
  echo "metapackage"
}
