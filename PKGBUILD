# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=python-icecream
_name=${pkgname#python-}
pkgver=2.1.1
pkgrel=1
pkgdesc="Sweet and creamy print debugging"
arch=('any')
url="https://github.com/gruns/icecream"
license=('MIT')
depends=('python-colorama>=0.3.9' 'python-pygments>=2.2.0' 'python-executing>=0.3.1' 'python-asttokens>=2.0.1')
makedepends=('python-setuptools')
provides=('icecream-debugging')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('47e00e3f4e8477996e7dc420b6fa8ba53f8ced17de65320fedb5b15997b76589')

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
