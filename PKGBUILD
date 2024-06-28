# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="nchess"
pkgname="${_pkgname}-git"
pkgver=r32.7489711
pkgrel=2
pkgdesc="Chess in the terminal, written in C99"
arch=('any')
url="https://github.com/billyvinning/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'ncurses')
makedepends=('git' 'make' 'gcc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.rst" "$pkgdir/usr/share/doc/${_pkgname}/README.rst"
  install -Dm644 "COPYING.rst" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.rst"
}
