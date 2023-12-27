# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=spatial-shell
pkgver=5
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
  "$pkgname-$pkgver.tbz::https://github.com/lthms/spatial-shell/releases/download/$pkgver/spatial-shell-$pkgver.tbz"
)
sha512sums=(
  '700ee2553f4d160caed2ac62b1f982b44b726297d8d3baa1e1b775c7d4eae7d5df22ad653a56418269e9d8e18265780d9bdfdf84d8a66aa4430324b9b4c7376f'
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
