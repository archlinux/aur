# Maintainer: Philipp Joram <mail AT phijor DOT me>

_gitname=citrus
pkgname=${_gitname}-3ds-git
pkgver=r105.71f027e
pkgrel=1
pkgdesc="Simplified 3DS homebrew library."
arch=('x86_64')
url="https://github.com/steveice10/citrus"
license=('custom')
depends=('ctrulib-git')
makedepends=('git' 'make' 'picasso-3ds-git')
source=("${pkgname}::git+https://github.com/steveice10/${_gitname}.git")
md5sums=('SKIP')
options=(!strip)

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git submodule update
}

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  install -dm755 ${pkgdir}${DEVKITPRO}/${_gitname}/
  cp -ar output/{include,lib} ${pkgdir}${DEVKITPRO}/${_gitname}/

  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
