# Maintainer: ml <>
pkgname=dcnnt
pkgver=0.3.6
pkgrel=1
pkgdesc='Yet another tool to connect Android phone with desktop similar to KDE Connect'
arch=('any')
url='https://github.com/cyanomiko/dcnnt-py'
license=('MIT')
depends=('python-pycryptodome')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver/$pkgname-py-$pkgver.tar.gz")
sha256sums=('9358aff1c0bdb227304923bdd7e539fda6ba5dea9e83fd772b1a23187ccf5271')

build() {
  cd "$pkgname-py-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-py-$pkgver"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a README.md doc/ -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
