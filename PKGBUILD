# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=spatial-shell
pkgver=3
pkgrel=1
pkgdesc='Implementing a spatial model inspired by Material Shell and Paper WM, for Sway.'
url=https://github.com/lthms/spatial-shell
license=('MPL2')
arch=('x86_64')
depends=(
  'sway'
)
optdepends=(
  'swaybg'
  'waybar'
)
makedepends=(
  'opam'
  'scdoc'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/lthms/spatial-shell/archive/refs/tags/$pkgver.tar.gz"
)
sha512sums=(
  '94e03ffe7989971e17bdecd5463cf549e6fe39457b53fc313994e7ad30fcc2c3b6e1a6a5d905496838eacb19f7dc81dced148090c05b9072d8e1134d29bbd3db'
)

prepare() {
  [ -f "${HOME}/.opam/config" ] || opam init -n
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make build-deps
  eval $(opam env)
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr" install
}
