# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>

_gitname=pyncp
pkgname=pyncp-git
pkgver=r12.0314369
pkgrel=2
pkgdesc="Python Network Copy"
arch=(any)
url="https://github.com/makefu/pyncp"
license=('WTFPL2')
depends=('python2')
makedepends=('git')
optdepends=('tk: visual ui')
source=(git://github.com/makefu/pyncp.git)
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"

  sed -i 's/env python/env python2/' ./src/pyncp.py
  sed -i 's/env python/env python2/' ./src/pyncp_vis.py
}

package() {
  cd "$_gitname"

  install -d $pkgdir/usr/bin
  install -m 755 ./src/pyncp.py $pkgdir/usr/bin/pyncp
  install -m 755 ./src/pyncp_vis.py $pkgdir/usr/bin/pyncp-vis

  install -d $pkgdir/usr/share/licenses/$_gitname
  install -m 644 ./COPYING $pkgdir/usr/share/licenses/$_gitname
}

# vim:set ts=2 sw=2 et:
