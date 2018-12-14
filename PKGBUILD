# Maintainer: Jan Buchar <Teyras@gmail.com>

pkgname=kwin-scripts-krohnkite-git
_gitname=krohnkite
pkgver=r124.e8db3e3
pkgrel=1
pkgdesc="A dynamic tiling extension for KWin"
arch=('any')
url="https://github.com/esjeon/krohnkite.git"
license=('MIT')
depends=('kwin')
makedepends=('make' 'plasma-framework' 'typescript' 'p7zip')
provides=("$_gitname")
conflicts=("$_gitname")
source=("$_gitname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/pkg"
  cd "${srcdir}/${_gitname}"
  HOME=${srcdir}/pkg make -e install
}

package() {
  cd "${srcdir}/${_gitname}"
  install -d "${pkgdir}/usr/share/kwin/scripts/${_gitname}"
  cp -ra "${srcdir}/pkg/.local/share/kwin/scripts/${_gitname}/." "${pkgdir}/usr/share/kwin/scripts/${_gitname}/"
  install -Dm644 "${srcdir}/pkg/.local/share/kwin/scripts/${_gitname}/metadata.desktop" "${pkgdir}/usr/share/kservices5/${_gitname}.desktop"
}
