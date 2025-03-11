# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sudoku"
pkgname="tdb-${_name}"
pkgver=20060913
pkgrel=1
pkgdesc="A program for solving Sudoku puzzles"
arch=('x86_64')
url="https://www.tdb.fi/sudoku.shtml"
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')
_pkgsrc="${_name}-${pkgver}"
source=("tdb-${_pkgsrc}.tar.gz::https://www.tdb.fi/files/${_pkgsrc}.tar.gz"
        "${pkgname}_include_unistd.patch")
sha256sums=('b6891a043ecf88cbe83fcaa16474d6fab40df3b1a79cade4ad99a336c4423c12'
            'ab039e23f10775438a635265cd619c1b88b2af22b7285349625a65b06715e797')

prepare() {
  cd "${srcdir}/${_name}"
  patch -Np1 -i "${srcdir}/${pkgname}_include_unistd.patch"
}

build() {
  cd "${srcdir}/${_name}"
  # make

  g++ ${CXXFLAGS} ${LDFLAGS} -o "${pkgname}" ./*.cpp
}

package() {
  cd "${srcdir}/${_name}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "Readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/README"

  find . -type f \( -name 'evil*' -o -name 'hard*' \) -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/${pkgname}/{}" \;
}

# vim:set ts=2 sw=2 et:
