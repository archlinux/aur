# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=pyspeed
_pkgname=PySpeed
pkgver=0.1.1
pkgrel=1
pkgdesc="Add progress bars with easy pythonic wrapper iterators.  Py2 and Py3"
arch=('any')
url="https://launchpad.net/pyspeed"
license=('MIT')
depends=('python2')
optdepends=('python')
source=(http://launchpad.net/$pkgname/trunk/initial/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('9d24be9fd3635d5e6299da313a69a26b')

build() {
  cd "$srcdir"
  mkdir -p py3
  cp -r $_pkgname-$pkgver/* py3
  
  if which python2; then
    cd "$srcdir/$_pkgname-$pkgver"
    msg "Building for Python2"
    python2 setup.py build
  fi

  if which python3; then
    cd "$srcdir/py3"
    msg "Building for Python3"
    2to3 -w ./
    2to3 -w speed/
    python3 setup.py build
  fi
}

package() {
  if which python2; then
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir"
  fi

  if which python3; then
    cd "$srcdir/py3"
    python3 setup.py install --prefix=/usr --root="$pkgdir"
  fi
}

