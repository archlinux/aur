# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=spatial-shell
pkgver=4
pkgrel=1
pkgdesc='Implementing a spatial model inspired by Material Shell and Paper WM, for Sway.'
url=https://github.com/lthms/spatial-shell
license=('MPL2')
arch=('x86_64')
depends=(
  'sway'
)
optdepends=(
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
  'b16a251ca1dffb9c52f7aa180291c55b8eaa4b4bbbdf835bbbd4cf7902fa4134fe4336f42e74677db50c4f81552ff92f97566a542d113dd82559f995f8fa8bff'
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
