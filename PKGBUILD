# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-yolk3k
_name=${pkgname#python-}
pkgver=0.9
pkgrel=3
pkgdesc="Command-line tool for querying PyPI and Python packages installed on your system"
arch=('any')
url="https://github.com/myint/yolk"
license=('BSD')
depends=('python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('rstcheck: Check invalid reStructuredText in descriptions on PyPI')
provides=("${pkgname%3k}")
conflicts=("${pkgname%3k}")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cf8731dd0a9f7ef50b5dc253fe0174383e3fed295a653672aa918c059eef86ae')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
