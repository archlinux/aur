# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=ohsnapmod
_commit=425ba6590d
_pkgver=1.0.0
pkgver=1.0.0.r17.425ba65
pkgrel=1
pkgdesc="patched version of the ohsnap font"
arch=('any')
license=('MIT')
makedepends=('xorg-bdftopcf')
url="https://codeberg.org/h3xx/ohsnapmod"

source=("${pkgname}-${_pkgver}::git+https://codeberg.org/h3xx/ohsnapmod#commit=${_commit}")
sha256sums=('b2b9b55fce23bf0cb2f14d5dbcf997bd3c2ef0ac2ddc947759a0087357a40e4d')

pkgver() {
  cd "${pkgname}-${_pkgver}"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}-${_pkgver}"

  make
}

package() {
  cd "${pkgname}-${_pkgver}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/local" *.pcf.gz

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
