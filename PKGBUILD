# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=spatial-shell
pkgver=2
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
  'c51ee1727b14e18ea13ce492035365bdd5ef01ac2cef5affb8f9fa4c4dbd581d3bb076effcdd2dd5a02c6b8a8d903d8847eed0eb5bee360a6ece1a5f4a3cea5b'
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
