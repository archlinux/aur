# Maintainer: lmartinez-mirror
pkgname=python-icecream
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc="Sweet and creamy print debugging"
arch=('any')
url="https://github.com/gruns/icecream"
license=('MIT')
depends=('python' 'python-colorama>=0.3.9' 'python-pygments>=2.2.0' 'python-executing>=0.3.1' 'python-asttokens>=2.0.1')
makedepends=('python-setuptools')
provides=('icecream-debugging')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c2e7b74c1c12caa2cfde050f2e636493ee77a9fb4a494b5593418ab359924a24')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
