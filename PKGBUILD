# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=enc-dec-uricomp
pkgver=0.0.1
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Provides encodeuricomponent, decodeuricomonent and trim which you can feed from stdin"
arch=('any')
url="https://gitverse.ru/naierchou/mybible-module-mgb"
license=('GPL-3')
depends=()
makedepends=('go')
source=("git+https://gitverse.ru/naierchou/enc-dec-uricomp.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git rev-parse --short HEAD
}

build() {
  cd "$srcdir/${pkgname%-git}"
  go build -o build/encodeuricomponent ./cmd/encodeuricomponent
  go build -o build/decodeuricomponent ./cmd/decodeuricomponent
  go build -o build/trim ./cmd/trim
}

package() {
  PREFIX="/usr/local"
  cd "$srcdir/${pkgname%-git}"
  install -d $pkgdir${PREFIX}/bin/
  install -d $pkgdir${PREFIX}/share/enc-dec-uricomp/license/
  cp build/* $pkgdir${PREFIX}/bin/
  cp LICENSE $pkgdir${PREFIX}/share/enc-dec-uricomp/license/
}
