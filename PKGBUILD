# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Andrei Antoukh <niwi@niwi.be>

pkgname=python2-mongokit
pkgver=0.9.1.1
pkgrel=1
pkgdesc="Structured schema and validation layer on top of PyMongo"
arch=('any')
license=("BSD")
url="http://namlook.github.com/mongokit/"
depends=('python2' 'python2-pymongo')
source=("http://pypi.python.org/packages/source/m/mongokit/mongokit-$pkgver.tar.gz")
md5sums=('564c6af175b6cd8c2d3fa059e6900e88')

build() {
  cd "$srcdir/mongokit-$pkgver"
  python2 setup.py build
}
  
package() {
  cd "$srcdir/mongokit-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s/python/python2/' {} \;

  install -Dm 644 "$srcdir/mongokit-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

