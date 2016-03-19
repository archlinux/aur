# Maintainer: David Roble <robled@electronsweatshop.com>

pkgname=rocket-depot-git
pkgver=r290.1ce2db4
pkgrel=1
pkgdesc="rdesktop/xfreerdp frontend - git version"
arch=('any')
url="https://github.com/robled/rocket-depot"
license=('GPL3')
depends=('python2-setuptools' 'xterm'
         'rdesktop' 'freerdp' 'python2-gobject2')
makedepends=('git')
provides=('rocket-depot-git')
conflicts=('rocket-depot-git')
source=('git://github.com/robled/rocket-depot.git')
validpgpkeys=('B824D205724FFCA441BC7EB8FB2520321683174C')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/rocket-depot
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/rocket-depot
  python2 setup.py build
}

package() {
  cd ${srcdir}/rocket-depot
  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
