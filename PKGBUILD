# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgname=yanc-font
pkgver=1.0.0
pkgrel=2
pkgdesc='yet another neat condensed font. based on gohufont.'
arch=(any)
url='https://github.com/repomaa/yanc-font'
license=('MIT')
depends=()
makedepends=('git' 'fonttosfnt')

source=("${pkgname}::git+https://github.com/repomaa/yanc-font.git?signed#tag=v${pkgver}")
sha512sums=(SKIP)
provides=('yanc-font')
conflicts=('yanc-font-git')

validpgpkeys=(
  F0AF1CE34733B22317A8937D05557F53CD3C6458
)

build() {
  cd "${pkgname}"
  for file in *.bdf; do
    fonttosfnt -o "${file/%bdf/otb}" "$file"
  done
}

package() {
  cd "${pkgname}"
  install -d "$pkgdir/usr/share/fonts/misc"
  install -Dm644 *.otb "$pkgdir/usr/share/fonts/misc/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
