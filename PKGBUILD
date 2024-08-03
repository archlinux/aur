# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="nchess"
pkgname="${_pkgname}-git"
pkgver=r32.7489711
pkgrel=3
pkgdesc="Chess in the terminal, written in C99"
arch=('any')
url="https://github.com/billyvinning/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('git' 'ncurses')
depends=('glibc' 'ncurses')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_makefile")
sha256sums=('SKIP'
            '81c86b266a842e232c763dd1d74be1a77c83c8bdfd1a317acea560f102d9f832')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}"
  cp "${_pkgname}_makefile" "${srcdir}/${_pkgsrc}/Makefile"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" prefix='/usr' install

  install -Dm644 "README.rst"  "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -Dm644 "COPYING.rst" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.rst"
}
