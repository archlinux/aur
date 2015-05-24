# Maintainer: brent saner <bts@square-r00t.net>

pkgname=quake2world-data-git
pkgver=r408.1324b25
pkgrel=1
pkgdesc="A free, stand-alone, multiplayer-only iteration of Quake2 (game data)"
arch=('any')
url="http://quetoo.org"
license=('GPL')
source=(git+https://github.com/jdolan/quake2world-data.git)
md5sums=('SKIP')
#depends=('quake2world-git')
_pkgname=quake2world-data

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  install -d -m 0755 "${pkgdir}"/usr/share/quake2world
  cp -a ${srcdir}/quake2world-data/target/. ${pkgdir}/usr/share/quake2world
}
