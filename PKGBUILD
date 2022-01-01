# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=inquirer
pkgname="python-$_pkgname"
pkgver=2.9.1
pkgrel=1
pkgdesc="Collection of common interactive command line user interfaces, based on Inquirer.js"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-blessed' 'python-readchar' 'python-editor')
makedepends=('python-setuptools' 'python-dephell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magmax/python-inquirer/archive/v$pkgver.tar.gz")
sha256sums=('5daa3b37003677b826e29635a4b741324436a70772f503cbf9530e35f0be6c40')
b2sums=('ee6531420b8d5bd6fed667cec440e1800f6d40d2fc458c4a2892006304af90c5834aa16a2b1975ebe9159ad7894003035e93c499a469e128acccefff22627d5e')

prepare() {
  cd "python-inquirer-$pkgver"

  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "python-inquirer-$pkgver"

  python setup.py build
}

package() {
  cd "python-inquirer-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  rm -rf "$pkgdir/usr/lib"/python*/"site-packages/tests"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
