# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=mate-menu-git
pkgver=r453.3de5f14
pkgrel=1
pkgdesc="Mate Menu fork of MintMenu"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-menu/"
license=('GPL2')
makedepends=('git')
depends=('python2' 'python2-xlib' 'mate-applets' 'python2-distutils-extra' 'python2-setuptools')
source=('git+https://bitbucket.org/ubuntu-mate/mate-menu.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mate-menu"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/mate-menu"
  sed 's/python/python2/g' -i lib/mate-menu.py 
  sed 's/python/python2/g' -i lib/mate-menu-config.py 
}

package() {
   cd "$srcdir/mate-menu"
   python2 setup.py install --root="$pkgdir/" --optimize=1
   mkdir -p $pkgdir/usr/share/licenses/$pkgname
   install -m 0644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
