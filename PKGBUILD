# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=scikits-sparse
pkgname=python-$_pyname-git
pkgver=v0.2.r5.ge789587
pkgrel=1
pkgdesc='Sparse matrix tools extending scipy.sparse, but with incompatible licenses'
url='https://github.com/njsmith/scikits-sparse'
depends=('python-numpy' 'suitesparse')
makedepends=('cython')
license=('BSD')
arch=('i686' 'x86_64')
source=('git://github.com/njsmith/scikits-sparse.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pyname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pyname"
  sed -i 's/suitesparse\///' scikits/sparse/cholmod.pyx
  python setup.py build
  sed -n '/License/,$p' README > LICENSE
}

package() {
  cd "$srcdir/$_pyname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
