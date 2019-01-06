# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Kyle Meyer <kyle@kyleam.com> https://github.com/kyleam/maint-aur
pkgname=(python-ratelimiter python2-ratelimiter)
_pkgname=${pkgname#python-}
pkgver=1.2.0.post0
pkgrel=1
pkgdesc='Simple Python module providing rate limiting'
arch=('any')
url="https://github.com/RazerM/$_pkgname"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python2-pytest>=3.0' 'python-pytest>=3.0')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b8dbff5bdfd922126f20cd513473cfd0d61b017cd354cb641a3d50b62897eca9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  # build step only copies files, same for python and python2
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
#  python2 setup.py test # fails: asyncio not backported
}

package_python-ratelimiter() {
  depends=('python')

  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-ratelimiter() {
  depends=('python2')

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
