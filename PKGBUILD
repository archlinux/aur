
pkgname=python2-pyasn1-modules
pkgver=0.3.0
pkgrel=1
foldername="pyasn1_modules-$pkgver"
pkgdesc="A collection of ASN.1-based protocols modules"
arch=('any')
license=('BSD')
url="https://pypi.python.org/pypi/pyasn1-modules"
depends=('python2-pyasn1')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/p/pyasn1-modules/$foldername.tar.gz")
sha512sums=('fedcf95e0452e133fc0735a1be29fb5e7df563243203463c66b85d9af6194a550c78a96fec2d915be1aa6b98428f51b6ed4feb7ed3838c515d044fbafeb2cb46')

build() {
  cd "$foldername"
  python2 setup.py build
}

check() {
  cd "$foldername"
  PYTHONPATH=. python2 tests/__main__.py
}

package() {
  cd "$foldername"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
