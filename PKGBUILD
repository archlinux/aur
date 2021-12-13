# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-sqlmodel
_pkgname="${pkgname#python-}"
pkgver=0.0.4
pkgrel=3
pkgdesc="SQL databases in Python, designed for simplicity, compatibility, and robustness"
arch=('any')
url="https://sqlmodel.tiangolo.com"
license=('MIT')
depends=('python' 'python-sqlalchemy' 'python-pydantic' 'python-sqlalchemy2-stubs')
makedepends=('python-build' 'python-poetry-core' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tiangolo/sqlmodel/archive/$pkgver.tar.gz")
b2sums=('85e337d75de4aeb80a4bfaf44914d3a69229edceb5ee2f0af496c57db45b3c93e260b327c3e41c2415c8f3ecffa4aa72ad53ae5cb64890d8c0589b0bd691f45d')

build() {
  cd "$_pkgname-$pkgver"

  # build sdist
  python -m build --sdist --skip-dependency-check --no-isolation

  # extract sdist
  cd dist
  bsdtar --strip-components 1 --extract --file *.tar.gz
}

package() {
  cd "$_pkgname-$pkgver/dist"
  python setup.py install --root="$pkgdir" --optimize=1

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
