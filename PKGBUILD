# Maintainer: Jesse R. Adams <jesse -at- techno -dash- geeks -dot- org>
# Maintainer: Solomon Choina <shlomochoina at gmail dot  com>
pkgname=obvious-git
pkgver=r389.63cd248
pkgrel=1
pkgdesc="Widgets for awesome wm (latest version)"
arch=(any)
url="https://github.com/hoelzro/obvious"
license=('custom:MIT')
depends=('awesome')
makedepends=('git')
source=(git://github.com/hoelzro/obvious.git)
md5sums=(SKIP)
_gitname=obvious

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir"
   install -d ${pkgdir}/usr/share/awesome/lib/${_gitname}
  cp -a ${_gitname}/* ${pkgdir}/usr/share/awesome/lib/${_gitname}
  rm ${pkgdir}/usr/share/awesome/lib/${_gitname}/{AUTHORS,CONTRIBUTING.md,LICENSE,TODO}
  install -Dm644 ${_gitname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE 
}
