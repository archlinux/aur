# Maintainer: David Strobach <lalochcz@gmail.com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname=kwin-scripts-tiling-git
_gitname=${pkgname%-git}
_pkgname=${_gitname/scripts/script}
pkgver=r495.aad49d6
pkgrel=1
pkgdesc="Tiling script for kwin"
arch=('any')
url="https://github.com/kwin-scripts/kwin-tiling.git"
license=('GPL')
depends=('kwin')
makedepends=('plasma-framework')
provides=("$_gitname")
conflicts=("$_gitname")
source=("$_gitname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/kwin-scripts-tiling/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  install -Dm644 "${srcdir}"/kwin-scripts-tiling/metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
}
