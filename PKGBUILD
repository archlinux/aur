# Maintainer: Thomas Letan <lthms@soap.coffee>

pkgname=spatial-shell
pkgver=6
pkgrel=1
pkgdesc='Implementing a spatial model inspired by Material Shell, for i3 and sway.'
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
  '113bd94b25e1d19ae6b727c9f846fda11d28a50380801a590de77290741e3e0d465ed8211b5e0aebb4c3a5fa4676e99d8f47abbfee0d96be5a91ed3449e34abf'
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
