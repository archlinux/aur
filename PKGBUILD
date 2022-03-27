# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=inquirer
pkgname="python-$_pkgname"
pkgver=2.9.2
pkgrel=1
pkgdesc="Collection of common interactive command line user interfaces, based on Inquirer.js"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-blessed' 'python-readchar' 'python-editor')
makedepends=('python-setuptools' 'python-dephell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magmax/python-inquirer/archive/v$pkgver.tar.gz")
sha256sums=('576bfedeead2e9531136da541109216f1732a405fb1157aeb31056890f3c4f63')
b2sums=('b8518a1620aa24f58f2ddf7d6ade2aa62d73c8c299a1deec31dc5c2c602815b1254859d398628ddfd8a76ad1d1ba2af12ba97dbf2c6c1a0b05d26f92c48633e5')

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
