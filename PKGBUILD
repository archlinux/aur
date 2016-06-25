# Maintainer: brent saner <bts@square-r00t.net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

pkgname=quake2world-data-git
pkgver=r408.1324b25
pkgrel=3
pkgdesc="A free, stand-alone, multiplayer-only iteration of Quake2 (game data)"
arch=('i686' 'x86_64')
url="http://quetoo.org"
license=('GPL')
source=(git+https://github.com/jdolan/quake2world-data.git)
sha512sums=('SKIP')
depends=('quake2world-git')
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
