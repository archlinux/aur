# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=pychess-db
_gitpkgname=chess_db
pkgver=20170627
pkgrel=1
pkgdesc='Chess game database, PGN format, curated by the PyChess organization'
arch=('any')
url='https://github.com/pychess/chess_db'
license=('GPL3')
optdepends=('pychess: browse and analyze games')
conflicts=('pychess-db-git')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pychess/chess_db/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
  '6fef6225c6cfb95873268a04a37bb286470a2d39a63c4381b21f2f9c310f316d9b035495a4442f44af0d98941744dfab98abcf5c5c293769d04607ed3389762c'
)

package() {
  echo >&2 'Packaging PGN files'
  mkdir -p "${pkgdir}/usr/share/pychess-db/pgn"
  cp -r --preserve=mode -T \
    "${srcdir}/${_gitpkgname}-${pkgver}/pgn" \
    "${pkgdir}/usr/share/pychess-db/pgn"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_gitpkgname}-${pkgver}/Copying.txt"
}
