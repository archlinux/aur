# Maintainer: trizen

pkgname=oblogout-py3-git
pkgver=0.01
pkgrel=1
pkgdesc="Openbox Logout Menu, ported to Python 3."
arch=('any')
url="https://github.com/trizen/oblogout-py3"
depends=('python-pillow' 'python-configparser' 'python-cairo' 'python-gobject')
makedepends=('git' 'python-distlib' 'python-distutils-extra')
license=('GPL2')
backup=("etc/oblogout.conf")
provides=('oblogout')
conflicts=('openboxlogout-gnome' 'oblogout' 'oblogout-fork')
install="oblogout.install"

_pkgname="oblogout-py3"

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
