# Maintainer: trizen

pkgname=oblogout-py3-git
_pkgname="oblogout-py3"

pkgver=0.03.r0.g10113a1
pkgrel=1
pkgdesc="Openbox Logout Menu, ported to Python 3."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
depends=('python-pillow' 'python-cairo' 'python-gobject')
makedepends=('git' 'python-distutils-extra')
license=('GPL2')
backup=("etc/oblogout.conf")
provides=('oblogout')
conflicts=('oblogout' 'oblogout-fork-git')
install="oblogout.install"

source=("git+https://github.com/trizen/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/"
  install -m644 "data/oblogout.conf" "$pkgdir/etc/"
}
