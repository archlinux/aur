# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=vifm-colors-git
_pkgname=vifm-colors
pkgver=r71.39b5337
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
  for i in *.vifm
  do
    install -Dm644 "$i" "$pkgdir/usr/share/vifm/colors/$i"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/vifm-colors-git/README.md"
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/vifm-colors-git/ChangeLog"
  # remove due to conflict with vifm-git
  rm "$pkgdir/usr/share/vifm/colors/reicheltd-light.vifm"

}

# vim:set ts=2 sw=2 et:
