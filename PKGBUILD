# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=kose-font
pkgname=ttf-${_pkgname%-font}-git
pkgver=3.11.r146.gd397cad
pkgrel=1
pkgdesc="A Chinese Font derived from SetoFont / Naikai Font / cjkFonts-AllSeto"
arch=('any')
license=('OFL')
url="https://github.com/lxgw/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" TTF\ \(*\)/*.ttf

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 OpenType_Features.md "${pkgdir}/usr/share/doc/${pkgname%-git}/OpenType_Features.md"
  install -Dm644 history.md "${pkgdir}/usr/share/doc/${pkgname%-git}/CHANGELOG.md"
  install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(head -n 1 history.md | grep -oE '[0-9]+\.[0-9]+').r$(git rev-list HEAD --count).g$(git rev-parse --short HEAD)"
}
