# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="nchess"
pkgname="${_pkgname}-git"
pkgver=r32.7489711
pkgrel=4
pkgdesc="Chess in the terminal, written in C99"
arch=('x86_64')
url="https://github.com/billyvinning/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  gcc ${CFLAGS} ${LDFLAGS} main.c -o "../${_pkgname}" -std=c99 -I engine -I tui -lncurses -lm
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.rst"  "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -vDm644 "COPYING.rst" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.rst"
}
