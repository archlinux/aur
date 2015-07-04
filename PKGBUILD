# Maintainer:  Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

pkgname=python2-schedutils
pkgver=0.4
pkgrel=5

pkgdesc="Python module to interface with the Linux scheduler"
url="https://git.kernel.org/cgit/libs/python/python-schedutils/python-schedutils.git/"
arch=('x86_64' 'i686')
license=('GPL')

depends=('python2')
makedepends=('git')

source=("$pkgname::git://git.kernel.org/pub/scm/libs/python/python-schedutils/python-schedutils.git")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  sed -i '1s/python/python2/' pchrt.py
  sed -i '1s/python/python2/' ptaskset.py
}

build() {
  cd $pkgname
  python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --skip-build --root="$pkgdir"
  install -D -p -m 775 pchrt.py "$pkgdir"/usr/bin/pchrt
  install -p -m 775 ptaskset.py "$pkgdir"/usr/bin/ptaskset
}
# vim:set ts=2 sw=2 et:
