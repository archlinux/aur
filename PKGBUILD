# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Benjamin Frank <ben+aur@pipsfrank.de>

pkgname=urxvt-resize-font-git
_gitname=urxvt-resize-font
pkgver=4.5336d3f
pkgrel=2
pkgdesc='An urxvt plugin to adjust the font size on the fly'
arch=('any')
url="https://github.com/simmel/urxvt-resize-font"
license=('MIT')
depends=('rxvt-unicode')
makedepends=('git')
provides=("urxvt-resize-font")
conflicts=("urxvt-resize-font")
install=urxvt-resize-font-git.install
source=(${pkgname}::git+https://github.com/simmel/${_gitname}.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  head resize-font -n14|tail -n13 > LICENSE
}

package() {
  cd ${pkgname}
  install -Dm 755 resize-font "${pkgdir}/usr/lib/urxvt/perl/resize-font"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
