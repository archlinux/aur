# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=yanc-font-git
pkgver=0.r40.b690500
pkgrel=2
pkgdesc='yet another neat condensed font. based on gohufont.'
arch=(any)
url='https://github.com/jreinert/yanc-font'
license=('MIT')
depends=()
makedepends=('git' 'fonttosfnt')

source=("${pkgname}::git+https://github.com/jreinert/yanc-font.git")
sha512sums=(SKIP)
provides=('yanc-font')
conflicts=('yanc-font')

pkgver() {
  cd "${pkgname}"
  printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/yanc-font-git/LICENSE"
}

# vim:set ts=2 sw=2 et:
