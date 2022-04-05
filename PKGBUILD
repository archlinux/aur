# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-kiss-headers
_name=${pkgname#python-}
pkgver=2.3.0
pkgrel=3
pkgdesc="Python package for HTTP/1.1 style headers. Parse headers to objects."
arch=('any')
url="https://www.kiss-headers.tech"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bdf60780f867d80780e70abea9ad8c7f6d903a17789538cbd1670908bdced64b')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
