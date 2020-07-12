# Maintainer: Matthew Murray <matt@mattmurr.xyz>
pkgname=open-fprintd-git
_pkgname=open-fprintd
pkgver=r13.36414fd
pkgrel=1
pkgdesc="Fprintd replacement which allows you to have your own backend as a standalone service"
arch=(any)
license=(MIT)
depends=(python fprintd-clients)
makedepends=(python-setuptools)
conflicts=($_pkgname)
provides=($_pkgname)
url="https://github.com/uunicorn/${_pkgname}"
source=("git+${url}.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname
  python setup.py install --prefix=/usr --root $pkgdir || return 1
}

# vim:set ts=2 sw=2 et:
