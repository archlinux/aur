# Contributor: Robert Knauer <robert@privatdemail.net>

pkgname=jeopardy
pkgver=0.9.7
pkgrel=1
pkgdesc="Implementation of well known Jeopardy! quiz show in C++ with Qt"
arch=('i686' 'x86_64')
url="https://github.com/chlange/jeopardy"
license=('BSD')
depends=('qt4' 'phonon-qt4')
source=(
  "https://github.com/chlange/jeopardy/archive/refs/tags/v0.9.7-Linux.tar.gz"
)
sha256sums=(
  '5641647499f133fb803391bdb2154430ef7c9876e7a6125003bd11b992f55c1a'
)

build() {
  cd "${srcdir}/${pkgname}-0.9.7-Linux"
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-0.9.7-Linux"
  install -D -m 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  for f in answers/*.jrf; do
    install -D -m 644 ${f} "${pkgdir}/usr/share/${pkgname}/${f}"
  done
  install -D -m 644 images/icon.svg "${pkgdir}/usr/share/${pkgname}/images/icon.svg"
  install -D -m 644 sound/${pkgname}.wav "${pkgdir}/usr/share/${pkgname}/sound/${pkgname}.wav"
}
