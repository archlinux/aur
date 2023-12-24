# Maintainer: Popolon <popolon(aLpopolon°org>

pkgname=lfb-git
_pkgname=lfb
pkgver=r29.g8c7e98b
pkgrel=1
pkgdesc="Lua binding to Linux Framebuffers, using no external dependencys."
arch=('x86_64' armv7h aarch64 riscv32 riscv64)
url='https://github.com/max1220/lfb'
license=('MIT')
depends=('lua51' 'lua51-socket')
makedepends=('git')

source=(
  "git+https://github.com/max1220/${_pkgname}"
)

sha256sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd ${_pkgname}
  install -Dm644 lfb.h "${pkgdir}/usr/include/lfb.h"
  install -D lfb.so "${pkgdir}/usr/lib/lfb.so"
}
