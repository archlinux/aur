# Maintainer: ml <>
pkgname=dcnnt
pkgver=0.3.8
pkgrel=1
pkgdesc='Yet another tool to connect Android phone with desktop similar to KDE Connect'
arch=('any')
url='https://github.com/cyanomiko/dcnnt-py'
license=('MIT')
depends=('python-pycryptodome')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver/$pkgname-py-$pkgver.tar.gz")
sha256sums=('0ae186a994d968dcf9c60193a250568d57de68446856343a8cdd71c2a02eade5')

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
