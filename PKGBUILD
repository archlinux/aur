pkgname=python2-gertty
pkgver=1.5.0
pkgrel=1
pkgdesc="console-based interface to the Gerrit Code Review system"
arch=('any')
url='https://pypi.python.org/pypi/gertty'
license=('Apache2')
source=("https://pypi.io/packages/source/g/gertty/gertty-$pkgver.tar.gz")
sha256sums=('290e4dc688b2f4d6886f0493b861c01a8c0419dd6c49a925fba0b936d3f28b23')
makedepends=('python2' 'python2-setuptools' 'python2-sphinx')
depends=('python2-gitpython' 'python2-sqlalchemy' 'python2-urwid' 'python2-dateutil' 'python2-requests' 'python2-ordereddict' 'python2-alembic' 'python2-yaml' 'python2-ply' 'python2-voluptuous' 'python2-pbr' 'python2-six')
conflicts=('python2-gertty-git')

package() {
  cd $srcdir/gertty-$pkgver
  python2 setup.py install --root=$pkgdir
  sphinx-build2 -b man doc/source doc/build/man
  gzip doc/build/man/gertty.1
  install -D -m644 doc/build/man/gertty.1.gz $pkgdir/usr/share/man/man1/gertty.1.gz
}
