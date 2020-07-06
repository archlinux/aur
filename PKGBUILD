# Maintainer: trizen

pkgname=oblogout-py3-git
_pkgname="oblogout-py3"

pkgver=0.02
pkgrel=2
pkgdesc="Openbox Logout Menu, ported to Python 3."
arch=('any')
url="https://github.com/trizen/${_pkgname}"
depends=('python-pillow' 'python-cairo' 'python-gobject')
makedepends=('git' 'python-distutils-extra')
license=('GPL2')
backup=("etc/oblogout.conf")
provides=('oblogout')
conflicts=('openboxlogout-gnome' 'oblogout' 'oblogout-fork')
install="oblogout.install"


source=("git+https://github.com/trizen/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --always | sed -e 's|-|.|g'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/"
  install -m644 "data/oblogout.conf" "$pkgdir/etc/"
}
