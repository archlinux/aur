# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=medet-git
pkgver=r18.8021339
pkgrel=1
pkgdesc="A portable decoder for METEOR M weather satellite LRPT signal"
arch=(i686 x86_64)
license=(GPL3)
url="https://github.com/artlav/meteor_decoder"
makedepends=(git fpc)
provides=(medet)
conflicts=(medet)
source=("${pkgname}::git+https://github.com/artlav/meteor_decoder.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  mkdir units
  fpc -CX -XX -O3 -Mdelphi -FUunits -Fualib medet.dpr
}

package() {
  cd "${pkgname}"

  install -Dm755 medet "${pkgdir}/usr/bin/medet"
}
