# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgname=ivre
pkgver=0.9.6
pkgrel=1
pkgdesc="Network recon framework"
url="https://ivre.rocks/"
arch=('any')
license=('GPL3')
depends=('python' 'python-crypto' 'python-pymongo')
optdepends=('python-py2neo: flow analysis support'
            'python-sqlalchemy: PostgreSQL backend support'
            'python-psycopg2: PostgreSQL backend support'
	    'python-pillow: Screenshots'
	    'python-dbus: 3D traceroute graphs'
	    'python-matplotlib: Plots')
makedepends=('git' 'python-setuptools')
source=(https://github.com/cea-sec/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('d82d20ec0dc8fcb8e521061636b99367faf5c2bf2051c6dfaa85fac8abf72f3b')

pkgver() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py --version
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/ivre/" doc/LICENSE*
  python setup.py install --root="$pkgdir" --optimize=1
}
