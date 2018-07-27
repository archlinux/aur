# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=vifm-colors-git
_pkgname=vifm-colors
pkgver=r51.d9b39e8
pkgrel=2
pkgdesc="Various colorschemes for vifm file explorer"
url="https://github.com/vifm/vifm-colors"
makedepends=('git')
conflicts=(vifm-colors)
license=('GPL')
arch=('any')
source=("${pkgname}"::'git+https://github.com/vifm/vifm-colors.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  theme=('darkdesert' 'desert' 'dracula' 'g80' 'lucius' 'matrix' 'mc-like')
  theme=(${theme[@]} 'molokai' 'near-default' 'ph' 'semidarkdesert')
  theme=(${theme[@]} 'snowwhite' 'solarized-dark' 'zenburn' 'zenburn_1')
  for i in "${theme[@]}"
  do
    install -Dm644 "$i.vifm" "$pkgdir/usr/share/vifm/colors/$i.vifm"
  done
}

# vim:set ts=2 sw=2 et:
