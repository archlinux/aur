# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=nchess-git
_pkgname=nchess
pkgver=r32.7489711
pkgrel=1
pkgdesc="Chess in the terminal, written in C99"
arch=('any')
url="https://github.com/billyvinning/nchess"
license=('GPL')
depends=('ncurses')
makedepends=('git' 'gcc' 'make')
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
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
  install -Dm644 "COPYING.rst" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.rst"
}

clean() {
  cd "${srcdir}/${_pkgsrc}"
  make clean
}
