# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Jeff Sharpe <jeff@impcode.com>
# Contributor: wido <widomaker2k7@gmail.com>

pkgname=fortune-mod-matrix
pkgver=20160822
pkgrel=2
pkgdesc="Fortune cookies: The Matrix trilogy"
arch=('any')
license=('custom')
depends=('fortune-mod')
groups=('fortune-mods')
source=('fortunes.txt')
url="https://en.wikiquote.org/wiki/The_Matrix_%28franchise%29"
sha256sums=('69865bd645b9ba561b5750a183734d7b1edf0f997ed043adae739931e0be8ba3')

build() {
  if true; then # change true to false to have pure ASCII quotes
    cp "${srcdir}/fortunes.txt" "${srcdir}/matrix"
  else
    sed "s/’/'/g; s/é/e/g; s/è/e/g;" "${srcdir}/fortunes.txt" > "${srcdir}/matrix"
  fi
  strfile "${srcdir}/matrix" "${srcdir}/matrix.dat"
}

package() {
  install -D -m644 "${srcdir}/matrix" "${pkgdir}/usr/share/fortune/matrix"
  install -D -m644 "${srcdir}/matrix.dat" "${pkgdir}/usr/share/fortune/matrix.dat"
}
