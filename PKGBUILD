# Maintainer: ml <>
pkgname=dcnnt
pkgver=0.4.0
_commit=fad240d0e9d44e3d88f9c3444ac072361d1ded8a
pkgrel=1
pkgdesc='Yet another tool to connect Android phone with desktop similar to KDE Connect'
arch=('any')
url='https://github.com/cyanomiko/dcnnt-py'
license=('MIT')
depends=('python-pycryptodome')
makedepends=('python-setuptools')
source=("$url/archive/$_commit/$pkgname-py-$pkgver.tar.gz")
sha256sums=('ae14b4c5f672f07b94f46db1de58ca2d73298eee873d71da21b3d4b85d0657dd')

build() {
  cd "$pkgname-py-$_commit"
  python setup.py build
}

package() {
  cd "$pkgname-py-$_commit"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a README.md doc/ -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
