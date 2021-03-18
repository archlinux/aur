# Maintainer: ml <>
pkgname=dcnnt
pkgver=0.4.0
pkgrel=2
pkgdesc='Yet another tool to connect Android phone with desktop similar to KDE Connect'
arch=('any')
url='https://github.com/cyanomiko/dcnnt-py'
license=('MIT')
depends=('python-pycryptodome')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver/$pkgname-py-$pkgver.tar.gz")
sha256sums=('b49246b892383f10db63cb01ad2f3ec2d0b37082cbcf12cbc712dc0edf5e3b3b')

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
