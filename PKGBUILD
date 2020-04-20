pkgname=python-gertty
pkgver=1.6.0
pkgrel=1
pkgdesc="console-based interface to the Gerrit Code Review system"
arch=('any')
url='https://pypi.python.org/pypi/gertty'
license=('Apache2')
source=("https://pypi.io/packages/source/g/gertty/gertty-$pkgver.tar.gz")
sha256sums=('1c3593d2e6ce53bd84b27d6ac92df4a86d8923afd18b4f4f8e2c979f8a6277df')
makedepends=('python' 'python-setuptools' 'python-sphinx')
depends=('python-gitpython' 'python-sqlalchemy' 'python-urwid' 'python-dateutil' 'python-requests' 'python-alembic' 'python-yaml' 'python-ply' 'python-voluptuous' 'python-pbr' 'python-six')
conflicts=('python2-gertty' 'python2-gertty-git')

package() {
  cd $srcdir/gertty-$pkgver
  python setup.py install --root=$pkgdir
  sphinx-build -b man doc/source doc/build/man
  gzip doc/build/man/gertty.1
  install -D -m644 doc/build/man/gertty.1.gz $pkgdir/usr/share/man/man1/gertty.1.gz
}
